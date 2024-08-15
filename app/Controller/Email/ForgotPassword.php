<?php

namespace App\Controller\Email;

use App\Controller\Email\Alert;
use App\Utils\PasswordEncryptor;
use App\Utils\View;
use App\Utils\SendEmail;
use App\Model\Entity\SettingsSmtp as EntitySettingsSmtp;
use Exception;

class ForgotPassword extends Page
{

    /**
     * Método responsável por renderizar a view da home do painel
     * @param string $titleEmail
     * @param string $recipientsName
     * @param string $urlActive
     * @return string
     * @throws Exception
     */
    private static function getTemplateEmailForgotPassword(string $titleEmail,string $recipientsName, string $urlActive): string
    {
        //Conteúdo da home
        $content = View::render('email/content/get-new-password',[
            'titleEmail' => $titleEmail,
            'recipientsName' => $recipientsName,
            'content' => 'Que bom ter você de volta, ao nosso sistema Agenda Online da IASD Parque Regina.',
            'urlSetNewPassword' => $urlActive
        ]);

        // Retorna a pagina completa
        return parent::getPanel('Product Manager','IASD Parque Regina | Forgot Password',$content,'email');
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
        $sendEmail->subject = 'IASD Parque Regina | Forgot Password';
        $sendEmail->body = self::getTemplateEmailForgotPassword('Recuperar Senha',$nameSend, $urlActive);
        $sendEmail->altBody = 'IASD Parque Regina | Forgot Password';

        return $sendEmail->send();
    }
}