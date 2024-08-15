<?php


namespace App\Controller\Application;

use App\Http\Request;
use App\Session\Users\Login as SessionUsersLogin;
use App\Model\Entity\Organization as EntityOrganization;
use App\Model\Entity\AccessModules as EntityAccessModules;
use App\Controller\Log\Log as ControllerLog;
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
     * @var array
     */
    private static array $scripts = [
        'onlineSession' => [
            'script' => 'application/js/scripts/online-session',
            'timeout' => 10000
        ],
        'autoLogout' => [
            'script' => 'application/js/scripts/auto-logout',
            'timeout' => 300000
        ],
        'clearSession' => [
            'script' => 'application/js/scripts/clear-session',
            'timeout' => 0
        ],
        'passwd' => [
            'script' => 'application/js/scripts/passwd',
            'timeout' => 0
        ],
        'exibir-senha' => [
            'script' => 'application/js/scripts/show-passwd',
            'timeout' => 0
        ],
        'update-ask-to-change' => [
            'script' => 'application/js/scripts/btn-update-ask-to-change',
            'timeout' => 0
        ],
        'event-click-link' => [
            'script' => 'application/js/scripts/event-click-link',
            'timeout' => 0
        ]
    ];

    /**
     * @throws Exception
     */
    public static function setLog(Request $request, string $class, string $data)
    {
        // recupera variáveis de sessão do usuário
        $session=SessionUsersLogin::getDataSession();
        //Debug::debug($session);
        return ControllerLog::setLog($request,$session['usuario']['id'],$class,$data,$session['usuario']['token']);
    }

    /**
     * @param Request $request
     * @param Pagination $obPagination
     * @return string
     */
    public static function getPagination($request, $obPagination)
    {
        // Obter as paginas
        $pages = $obPagination->getPages();

        // Verifica se tem mais de uma pagina
        if(count($pages) <= 1) return '';

        //Links
        $links ='';

        //URL atual sem GETS
        $url = $request->getRouter()->getCurrentUrl();

        // GET
        $queryParams = $request->getQueryParams();

        // Renderizar os links
        foreach ($pages as $page){
            $queryParams['page'] = $page['page'];

            // Monta Link da pagina
            $link = $url.'?'.http_build_query($queryParams);

            // Renderização da VIEW
            $links .=  View::render('application/pagination/link',[
                'page' => $page['page'],
                'link' => $link,
                'active' => $page['current'] ? 'active': ''
            ]);
        }

        // Renderiza Box de Paginação
        return View::render('application/pagination/box',[
            'links' => $links
        ]);
    }

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
     * Método responsável por renderizar a view do menu do painel
     * @param string $currentModule
     * @return string
     */
    private static function getMenu(string $currentModule): string
    {
        // Carrega os dados da organização
        $obOrganization = EntityOrganization::getOrganization(null,'created_at DESC')->fetchObject();

        //Links do menu
        $links = '';

        while ($obAccessModules = $result->fetchObject(EntityAccessModules::class)){
            $links .= View::render('application/menu/link', [
                'label' => $obAccessModules->label,
                'link' => URL . '/application'. $obAccessModules->path_module,
                'icon' => $obAccessModules->icon,
                'current' => $obAccessModules->module == $currentModule ? 'active' : ''
            ]);
        }

        // Retorna a renderização do menu
        return View::render('application/menu/box', [
            'links' => $links,
            'companyName' => $obOrganization->short_name
        ]);
    }

    /**
     * Método responsável por retornar os scripts js
     * @return string
     */
    private static function getScripts(): string
    {
        // recupera variáveis de sessão do usuário
        $session=SessionUsersLogin::getDataSession();

        //scripts
        $scripts = '';

        //Intera nos módulos
        foreach (self::$scripts as $module) {
            $scripts .= ViewJS::render($module['script'],[
                'host' => URL,
                'timeout' => (int)$module['timeout'],
                'token' => $session['usuario']['token']
            ]);
        }

        // retornar os scripts para todas as páginas
        return View::render('application/js/view/script',[
            'scripts' => $scripts
        ]);
    }

    /**
     * @return string
     */
    private static function getPasswd(): string
    {
        return View::render('application/passwd/passwd',[
            'urlPasswd' => URL . '/application/update-passwd'
        ]);
    }

    /**
     * @param int $levelId
     * @return array
     */
    private static function getMainPath(int $levelId)
    {
        // recupera módulos para o level
        $obAccessModules = EntityAccessModules::getAccessModules('level_id = '. $levelId . ' AND type_id_module = 1' ,null,1)->fetchObject(EntityAccessModules::class);

        // retorna o path do primeiro modulo habilitado
        return [ 'path' => $obAccessModules->home_path . $obAccessModules->path_module, 'label' => $obAccessModules->label ];
    }

    /**
     * Método responsável por retornar se usuário o nível do usuário tem permissão para editar sua senha
     * @param int $levelId
     * @param int $moduleId
     * @return string|null
     */
    private static function getAllowUpdatePassword(int $levelId, int $moduleId)
    {
        // recupera módulos para o level
        $obAccessModules = EntityAccessModules::getAccessModuleByIdByLevelId($levelId, $moduleId);

        // retorna
        return $obAccessModules instanceof EntityAccessModules ? null: 'disabled';
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
        //$session=SessionUsersLogin::getDataSession();
        $username = $session['usuario']['nome']?? 'Conta';

        //$ret = self::getMainPath($session['usuario']['nivel']);

        //$path = $ret['path'];
        //$label = $ret['label'];

        // Carrega os dados da organização
        $obOrganization = EntityOrganization::getOrganization(null,'created_at DESC')->fetchObject();

        // Renderiza a view do painel
        $contentPanel = View::render('application/panel', [
            //'menu' => self::getMenu($currentModule),
            //'disabledUpdatePassword' => self::getAllowUpdatePassword($session['usuario']['nivel'],12),
            'content' => $content,
            //'passwd' => self::getPasswd(),
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