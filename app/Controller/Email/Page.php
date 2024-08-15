<?php


namespace App\Controller\Email;

use App\Controller\Log\Log as ControllerLog;
use App\Http\Request;
use App\Session\Users\Login as SessionUsersLogin;
use App\Model\Entity\Organization as EntityOrganization;
use App\Model\Entity\AccessModules as EntityAccessModules;
use App\Utils\Debug;
use App\Utils\Pagination;
use App\Utils\View;
use App\Utils\ViewJS;
use DateTime;
use DateTimeZone;
use Exception;

class Page
{

    /**
     * Método responsável por retornar o conteúdo da estrutura de páginas do painel
     * @param string $title
     * @param string $content
     * @param string|null $script
     * @return string
     * @throws Exception
     */
    public static function getPage(string $title, string $content, string $script = null): string
    {
        return View::render('email/page', [
            'title' => $title,
            'content' => $content
        ]);
    }

    /**
     * Método responsável por retornar a assinatura do email
     * @param string $teamOwn
     * @return string
     */
    private static function getSignature(string $teamOwn): string
    {
        return View::render('email/content/signature', [
            'equipe' =>  $teamOwn,
            //'imgSignature' => 'data:image/png;base64,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',
            'imgSignature' => 'https://iasd-pqregina.com.br/app-agenda/lib/img/favicon.png'
        ]);
    }

    /**
     * @throws Exception
     */
    public static function setLog(Request $request, string $class, string $data, string $token, int $userId)
    {
        //Debug::debug($session);
        //return [ 'success'=> true ];
        return ControllerLog::setLog($request, $userId, $class,$data,$token);
    }

    /**
     * Método responsável por renderizar a view do painel com conteúdos dinâmicos
     * @param string $teamOwn
     * @param string $title
     * @param string $content
     * @param string $currentModule
     * @param string|null $script
     * @return string
     * @throws Exception
     */
    public static function getPanel(string $teamOwn,string $title, string $content, string $currentModule, string $script = null): string
    {

        // Carrega os dados da organização
        $obOrganization = new EntityOrganization();

        // Renderiza a view do painel
        $contentPanel = View::render('email/panel', [
            'content' => $content,
            'signature' => ($teamOwn === 'byPass')? null : self::getSignature($teamOwn)
        ]);

        // Retorna a página renderizada
        return self::getPage($title, $contentPanel,$script);
    }
}