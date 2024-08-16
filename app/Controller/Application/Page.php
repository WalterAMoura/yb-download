<?php


namespace App\Controller\Application;

use App\Http\Request;
use App\Model\Entity\Organization as EntityOrganization;
use App\Utils\Debug;
use App\Utils\View;
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
        return View::render('application/page', [
            'title' => $title,
            'content' => $content,
            'scriptTable' => null,
            'scripts' => null
        ]);
    }

    /**
     * Método responsável por renderizar a view do painel com conteúdos dinâmicos
     * @param string $title
     * @param string $content
     * @param string $currentModule
     * @param string|null $script
     * @return string
     * @throws Exception
     */
    public static function getPanel(string $title, string $content, string $currentModule, string $script = null): string
    {
        // recupera variáveis de sessão do usuário
        $username = $session['usuario']['nome']?? 'Conta';

        // Carrega os dados da organização
        $obOrganization = new EntityOrganization();

        // Renderiza a view do painel
        $contentPanel = View::render('application/panel', [
            'content' => $content,
            'userName' => $username,
            'developed' => $obOrganization->development,
            'versionApp' => $obOrganization->version,
            'site' => $obOrganization->site,
            'copyrigth' => 'Copyright &copy; 2023-'. (new DateTime('now', new DateTimeZone('America/Sao_Paulo')))->format('Y')
        ]);

        // Retorna a página renderizada
        return self::getPage($title, $contentPanel,$script);
    }
}