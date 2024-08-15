<?php

namespace App\Controller\Email;

use App\Http\Request;
use App\Model\Entity\ApiKey as EntityApikey;
use App\Model\Entity\Organization as EntityOrganization;
use App\Model\Entity\PasswordTemp as EntityPasswordTemp;
use App\Model\Entity\User as EntityUser;
use App\Model\Entity\ActiveAccountUsers as EntityActiveAccountUsers;
use App\Utils\Debug;
use App\Utils\GeneratePassword;
use App\Utils\JWEDecrypt;
use App\Utils\JWEEncrypt;
use App\Utils\PasswordEncryptor;
use App\Utils\UUID;
use App\Utils\View;
use App\Utils\SendEmail;
use App\Model\Entity\SettingsSmtp as EntitySettingsSmtp;
use DateTime;
use DateTimeZone;
use Exception;

class Register extends Page
{
    /**
     * Método responsável por renderizar a view da home do painel
     * @param Request $request
     * @return string
     * @throws Exception
     */
    public static function getActiveAccount(Request $request): string
    {
        // content para renderizar na página
        $content = '';

        // recupera queryParams
        $queryParams = $request->getQueryParams();
        $token = $queryParams['token'];

        // realiza o decode do token
        $tokenDecrypt=self::checkToken($token, $request);

        // recupera o path da apikey
        $obApikey = EntityApikey::getApikeyByKey($tokenDecrypt['decrypt']['customScopes']->apikey);
        $path = $obApikey->api_path??'';

        // Obtendo informações sobre a pilha de chamadas
        $trace = debug_backtrace(DEBUG_BACKTRACE_PROVIDE_OBJECT, 2);
        //registra log
        parent::setLog($request, $trace[0]['class'] . '->' .  $trace[0]['function'], $tokenDecrypt['status'] . ' de ativação da conta.',$token,$tokenDecrypt['decrypt']['id']??-1);

        //Debug::debug($tokenDecrypt);
        if($tokenDecrypt['status'] === 'unauthorized' || $tokenDecrypt['decrypt']['customScopes']->path !== $path){
            $content = self::getFailActiveAccount();
        }else{
            if(self::setActiveUser($tokenDecrypt['decrypt']['id'])){
                self::setVerifiedToken($token);
                $content = self::getSuccessActiveAccount();

                $password = 'NULL';
                $obUser = EntityUser::getUserById($tokenDecrypt['decrypt']['id']);

                self::sendEmailSuccessActiveAccount($obUser->email,$obUser->name, $tokenDecrypt['decrypt']['iss'],$obUser->login,$password);

            }else{
                $content = self::getFailRequestNewToken($tokenDecrypt['decrypt']['login']);
            }
        }

        // Retorna a pagina completa
        return parent::getPanel('byPass','IASD Parque Regina | Active Account',$content,'email');
    }

    /**
     * @param int $idUser
     * @return boolean
     * @throws Exception
     */
    private static function setActiveUser(int $idUser): bool
    {
        $obUser = EntityUser::getUserById($idUser);

        if(!$obUser instanceof EntityUser){
            return false;
        }

        $obUser = new EntityUser();
        $obUser->id = $idUser;
        $obUser->id_status = 1;
        return $obUser->updateActiveted();

    }

    /**
     * @param string $token
     * @return boolean
     * @throws Exception
     */
    private static function setVerifiedToken(string $token): bool
    {
        $obActiveAccountUser = EntityActiveAccountUsers::getActiveAccountUsersByToken($token);

        if(!$obActiveAccountUser instanceof EntityActiveAccountUsers){
            return false;
        }

        $id = $obActiveAccountUser->id;
        $obActiveAccountUser = new EntityActiveAccountUsers();
        $obActiveAccountUser->id = $id;
        $obActiveAccountUser->status_token = 1;
        return $obActiveAccountUser->updateVerified();

    }

    /**
     *  Método responsável por renderizar a view success active account
     * @return string
     * @throws Exception
     */
    private static function getSuccessActiveAccount(): string
    {
        // Retorna a pagina completa
        return View::render('email/content/success-active-account',[
            'title' => 'Ativação de Conta Concluída',
            'message_1' => 'Parabéns! Sua conta foi ativada com sucesso.',
            'message_2' => 'Você receberá no seu email seus dados de acesso para aproveitar todos os recursos do nosso sistema.',
            'imgSignature' => URL . '/' . PATH_LOGO_PNG,
            'urlLogin' => URL
        ]);
    }

    /**
     *  Método responsável por renderizar a view success active account
     * @return string
     * @throws Exception
     */
    private static function getFailActiveAccount(): string
    {
        // Retorna a pagina completa
        return View::render('email/content/fail-active-account',[
            'title' => 'Tempo Expirado - Solicitação de Novo Token',
            'message_1' => 'O tempo para ativação da sua conta expirou.',
            'message_2' => 'Por favor, informe seu endereço de e-mail abaixo para receber um novo token de ativação.',
            'imgSignature' => URL . '/' . PATH_LOGO_PNG,
            'urlRequestToken' => 'register-request-token'
        ]);
    }

    /**
     *  Método responsável por renderizar a view success active account
     * @param string $email
     * @return string
     */
    private static function getFailRequestNewToken(string $email): string
    {
        // Retorna a pagina completa
        return View::render('email/content/fail-request-token',[
            'title' => 'E-mail Não Encontrado',
            'message_1' => 'O e-mail ['. $email .'] informado não foi encontrado no sistema.',
            'message_2' => 'Por favor, entre em contato com o administrador do sistema para obter assistência.',
            'imgSignature' => URL . '/' . PATH_LOGO_PNG,
            'urlRequestToken' => 'register-request-token'
        ]);
    }

    /**
     *  Método responsável por renderizar a view success active account
     * @return string
     * @throws Exception
     */
    private static function getSuccessRequestNewToken(): string
    {
        // Retorna a pagina completa
        return View::render('email/content/success-request-token',[
            'title' => 'Solicitação de Novo Token - Sucesso',
            'message_1' => 'A solicitação de novo token foi realizada com sucesso.',
            'message_2' => 'Por favor, confira sua caixa de e-mail para obter o novo token de ativação.',
            'imgSignature' => URL . '/' . PATH_LOGO_PNG,
            'urlRequestToken' => 'register-request-token'
        ]);
    }

    /**
     * Método responsável por renderizar a view da home do painel
     * @param Request $request
     * @return string
     * @throws Exception
     */
    public static function getNewToken(Request $request): string
    {
        // content para renderizar na página
        $content = '';

        // recupera postVars
        $postVars = $request->getPostVars();
        $email = $postVars['email'];

        // Obtém o depoimento do banco de dados
        $obUser = EntityUser::getUserByEmail($email);

        //Debug::debug($tokenDecrypt['decrypt']['customScopes']->apikey);
        if(!$obUser instanceof EntityUser){
            $content = self::getFailRequestNewToken($email);
        }else{
            $obSettingSmtp = EntitySettingsSmtp::getSettingsSmtpActive();

            $obApikey = EntityApikey::getApikeyById($obSettingSmtp->id_apikey);

            $uuid = new UUID();
            $token = $uuid->getUUID();

            $jwe = self::getToken($obUser->id,$obUser->name,$obUser->email,$token, $obApikey->api_key, '/email/active-account');

            $urlActive = URL . '/email/active-account?token='. $jwe;

            $success=self::sendEmailActiveAccount($obUser->email,$obUser->name, $urlActive);

            if($success === true){

                $expirationDate = new DateTime('now', new DateTimeZone('America/Sao_Paulo'));
                $expirationDate->modify('+15 minutes');
                $expirationDate = $expirationDate->setTimezone(new DateTimeZone('UTC'));

                $obActiveAccountUsers = new EntityActiveAccountUsers();
                $obActiveAccountUsers->id_user = $obUser->id;
                $obActiveAccountUsers->token = $jwe;
                $obActiveAccountUsers->expiration_at = $expirationDate->format('Y-m-d H:i:s');
                $obActiveAccountUsers->status_token = 2;
                $obActiveAccountUsers->cadastrar();

                $content = self::getSuccessRequestNewToken();
            }else{
                $content = self::getFailRequestNewToken($email);
            }

        }

        // Retorna a pagina completa
        return parent::getPanel('byPass','IASD Parque Regina | Active Account',$content,'email');
    }

    /**
     * Método responsável por renderizar a view da home do painel
     * @param string $titleEmail
     * @param string $recipientsName
     * @param string $urlActive
     * @param string $username
     * @param string $password
     * @return string
     * @throws Exception
     */
    private static function getTemplateEmailSuccessActiveAccount(string $titleEmail,string $recipientsName, string $urlActive, string $username, string $password): string
    {
        //Conteúdo da home
        $content = View::render('email/content/email-success-active',[
            'titleEmail' => $titleEmail,
            'recipientsName' => $recipientsName,
            'content' => 'Sua conta foi ativada com sucesso!',
            'username' => $username,
            'password' => 'Utilize a mesma senha que você forneceu no momento do cadastro.',
            'urlLogin' => $urlActive
        ]);

        // Retorna a pagina completa
        return parent::getPanel('Product Manager','IASD Parque Regina | Active Account',$content,'email');
    }

    /**
     * @param string $emailSend
     * @param string $nameSend
     * @param string $urlActive
     * @param string $username
     * @param string $password
     * @return bool
     * @throws \PHPMailer\PHPMailer\Exception
     * @throws Exception
     */
    public static function sendEmailSuccessActiveAccount(string $emailSend, string $nameSend, string $urlActive, string $username, string $password): bool
    {

        $obSettingSmtp = EntitySettingsSmtp::getSettingsSmtpActive();

        if(!$obSettingSmtp instanceof EntitySettingsSmtp){
            throw new Exception("Error ao recuperar informações de SMTP.",400);
        }

        $sendEmail = new SendEmail();
        $sendEmail->charSet = 'UTF-8';
        $sendEmail->host = $obSettingSmtp->host;
        $sendEmail->smtpSecure = 'tls';
        $sendEmail->port = $obSettingSmtp->port;
        $sendEmail->smtpAuth = true;
        $sendEmail->username = $obSettingSmtp->username;
        $sendEmail->password = PasswordEncryptor::decryptPassword($obSettingSmtp->password);
        $sendEmail->from = $obSettingSmtp->username;;
        $sendEmail->fromName  = $obSettingSmtp->from_name ;
        $sendEmail->emailSend = $emailSend;
        $sendEmail->nameSend = $nameSend;
        $sendEmail->wordWrap = 50;
        $sendEmail->isHtml = true;
        $sendEmail->subject = 'IASD Parque Regina | Success Active Account';
        $sendEmail->body = self::getTemplateEmailSuccessActiveAccount('Sucesso Ativação de Conta',$nameSend, $urlActive, $username, $password);
        $sendEmail->altBody = 'IASD Parque Regina | Success Active Account';

        return $sendEmail->send();

    }

    /**
     * Método responsável por renderizar a view da home do painel
     * @param string $titleEmail
     * @param string $recipientsName
     * @param string $urlActive
     * @return string
     * @throws Exception
     */
    private static function getTemplateEmailReprovedAccount(string $titleEmail,string $recipientsName, string $urlActive): string
    {
        //Conteúdo da home
        $content = View::render('email/content/reproved-account',[
            'title' => $titleEmail,
            'message_1' => 'Olá ' . $recipientsName .', infelizmente seu acesso não foi autorizado.',
            'message_2' => 'Por favor, entre em contato com diretor responsável pelo seu departamento ou procure o administrador do sistema para obter assistência.',
            'imgSignature' => URL . '/' . PATH_LOGO_PNG,
            'urlRequestToken' => 'register-request-token'
        ]);

        // Retorna a pagina completa
        return parent::getPanel('Product Manager','IASD Parque Regina | Active Account',$content,'email');
    }

    /**
     * Método responsável por renderizar a view da home do painel
     * @param string $titleEmail
     * @param string $recipientsName
     * @param string $urlActive
     * @return string
     * @throws Exception
     */
    private static function getTemplateEmailActiveAccount(string $titleEmail,string $recipientsName, string $urlActive): string
    {
        //Conteúdo da home
        $content = View::render('email/content/active-account',[
            'titleEmail' => $titleEmail,
            'recipientsName' => $recipientsName,
            'content' => 'Seja bem-vindo ao sistema Agenda Online da IASD Parque Regina, click no link abaixo para ativar a sua conta.',
            'urlActiveAccount' => $urlActive
        ]);

        // Retorna a pagina completa
        return parent::getPanel('Product Manager','IASD Parque Regina | Active Account',$content,'email');
    }

    /**
     * @param string $emailSend
     * @param string $nameSend
     * @param string $urlActive
     * @return bool
     * @throws \PHPMailer\PHPMailer\Exception
     * @throws Exception
     */
    public static function sendEmailActiveAccount(string $emailSend, string $nameSend, string $urlActive): bool
    {

        $obSettingSmtp = EntitySettingsSmtp::getSettingsSmtpActive();

        if(!$obSettingSmtp instanceof EntitySettingsSmtp){
            throw new Exception("Error ao recuperar informações de SMTP.",400);
        }

        $sendEmail = new SendEmail();
        $sendEmail->charSet = 'UTF-8';
        $sendEmail->host = $obSettingSmtp->host;
        $sendEmail->smtpSecure = 'tls';
        $sendEmail->port = $obSettingSmtp->port;
        $sendEmail->smtpAuth = true;
        $sendEmail->username = $obSettingSmtp->username;
        $sendEmail->password = PasswordEncryptor::decryptPassword($obSettingSmtp->password);
        $sendEmail->from = $obSettingSmtp->username;;
        $sendEmail->fromName  = $obSettingSmtp->from_name ;
        $sendEmail->emailSend = $emailSend;
        $sendEmail->nameSend = $nameSend;
        $sendEmail->wordWrap = 50;
        $sendEmail->isHtml = true;
        $sendEmail->subject = 'IASD Parque Regina | Active Account';
        $sendEmail->body = self::getTemplateEmailActiveAccount('Ativação de Conta',$nameSend, $urlActive);
        $sendEmail->altBody = 'IASD Parque Regina | Active Account';

        return $sendEmail->send();

    }

    /**
     * @param string $emailSend
     * @param string $nameSend
     * @param string $urlActive
     * @return bool
     * @throws \PHPMailer\PHPMailer\Exception
     * @throws Exception
     */
    public static function sendEmailReprovedAccount(string $emailSend, string $nameSend, string $urlActive): bool
    {

        $obSettingSmtp = EntitySettingsSmtp::getSettingsSmtpActive();

        if(!$obSettingSmtp instanceof EntitySettingsSmtp){
            throw new Exception("Error ao recuperar informações de SMTP.",400);
        }

        $sendEmail = new SendEmail();
        $sendEmail->charSet = 'UTF-8';
        $sendEmail->host = $obSettingSmtp->host;
        $sendEmail->smtpSecure = 'tls';
        $sendEmail->port = $obSettingSmtp->port;
        $sendEmail->smtpAuth = true;
        $sendEmail->username = $obSettingSmtp->username;
        $sendEmail->password = PasswordEncryptor::decryptPassword($obSettingSmtp->password);
        $sendEmail->from = $obSettingSmtp->username;;
        $sendEmail->fromName  = $obSettingSmtp->from_name ;
        $sendEmail->emailSend = $emailSend;
        $sendEmail->nameSend = $nameSend;
        $sendEmail->wordWrap = 50;
        $sendEmail->isHtml = true;
        $sendEmail->subject = 'IASD Parque Regina | Acesso Recusado';
        $sendEmail->body = self::getTemplateEmailReprovedAccount('Acesso Recusado',$nameSend, $urlActive);
        $sendEmail->altBody = 'IASD Parque Regina | Acesso Recusado';

        return $sendEmail->send();

    }

    /**
     * @param Request $request
     * @return array
     */
    public static function sendEmailActiveAccountApi(Request $request): array
    {
        $postVars = $request->getPostVars();
        $pass = $postVars['pass'];

        return [ 'success' => (isset($pass))? GeneratePassword::decryptPassword($pass) : GeneratePassword::generatePassword(16) ];
    }

    /**
     * @param int $id
     * @param string $user
     * @param string $login
     * @param string $token
     * @param string $apikey
     * @param string $path
     * @return mixed
     */
    private static function getToken(int $id, string $user, string $login, string $token, string $apikey, string $path): mixed
    {
        // Carrega os dados da organização
        $obOrganization = EntityOrganization::getOrganization(null,'created_at DESC',1)->fetchObject();

        $jwe = new JWEEncrypt($obOrganization->site,$obOrganization->short_name . ' - Active Account', $id, $user, $login, $token, ['apikey'=>$apikey,'path'=>$path],1200);

        return (string)$jwe->getEncrypt();
    }

    /**
     * @param string $token
     * @param Request $request
     * @return mixed
     * @throws Exception
     */
    private static function decryptToken(string $token, Request $request): mixed
    {
        //Post vars
        $decrypt = new JWEDecrypt($token, $request);
        return (array)$decrypt->getDencrypt();
    }

    /**
     * @param string $token
     * @param Request $request
     * @return string
     * @throws Exception
     */
    private static function checkToken(string $token, Request $request) : mixed
    {

        $decrypt = self::decryptToken($token, $request);

        $now = strtotime("now");

        if(!isset($decrypt['iss'])){
            return [ 'status' => 'falha', 'decrypt' => $decrypt ];
        }

        if($now >= $decrypt['exp']){
            return [ 'status' => 'expired', 'decrypt' => $decrypt ];
        }

        return [ 'status' => 'authorized', 'decrypt' => $decrypt ];
    }
}