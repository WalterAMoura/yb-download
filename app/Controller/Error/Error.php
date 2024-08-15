<?php

namespace App\Controller\Error;

use App\Controller\Error\Page;
use App\Http\Request;
use App\Model\Entity\AccessModules as EntityAccessModules;
use App\Model\Entity\Organization as EntityOrganization;
use App\Session\Users\Login as SessionUsersLogin;
use App\Utils\Debug;
use App\Utils\View;
use Exception;

class Error extends Page
{
    /**
     * @param int $levelId
     * @return array
     */
    private static function getMainPath(int $levelId)
    {
        // recupera modulos para o level
        $obAccessModules = EntityAccessModules::getAccessModules('level_id = '. $levelId . ' AND type_id_module = 1' ,null,1)->fetchObject(EntityAccessModules::class);

        // retorna o path do primeiro modulo habilitado
        return [ 'path' => $obAccessModules->home_path . $obAccessModules->path_module, 'label' => $obAccessModules->label ];
    }

    /**
     * Método responsável por rendrizar a view da home do painel
     * @param Request $request
     * @param integer|string $code
     * @param string $type
     * @return string
     * @throws Exception
     */
    public static function getError(Request $request, int|string $code, string $type = 'Error'): string
    {
        // Carrega os dados da organização
        $obOrganization = EntityOrganization::getOrganization(null,'created_at DESC',1)->fetchObject();

        if (!SessionUsersLogin::isLogged()) {
            $urlRedirect = URL;
        }else{
            $session=SessionUsersLogin::getDataSession();
            $username = $session['usuario']['nome']?? 'Conta';

            $ret = self::getMainPath($session['usuario']['nivel']);

            $urlRedirect = URL . $ret['path'];

            //Conteúdo da home
        }

        $path=$request->getPathUser();
        // retorno somente para api
        if($path === '/api'){
            // Altera o content type para json
            $request->getRouter()->setContentType('application/json');
            return self::getApiError($request, $code);
        }


        $content = View::render('error/'.$code,[
            'urlRedirect' => $urlRedirect
        ]);

        // Retorna a pagina completa
        return parent::getPage($obOrganization->full_name . ' | '. $type ,$content);
    }

    /**
     * @param Request $request
     * @param int $code
     * @return string
     * @throws Exception
     */
    private static function getApiError(Request $request, int $code)
    {
        switch ($code) {
            case 400:
                throw new Exception("Requisição inválida: ocorreu um erro nos dados enviados.", 400);
                break;
            case 401:
                throw new Exception("Não autorizado: você não possui permissão para acessar este recurso.", 401);
                break;
            case 403:
                throw new Exception("Acesso proibido: você não tem permissão para acessar este recurso.", 403);
                break;
            case 404:
                throw new Exception("Recurso não encontrado: a página ou o recurso solicitado não foi encontrado.", 404);
                break;
            case 405:
                throw new Exception("Método não permitido: o método de solicitação não é suportado para este recurso.", 405);
                break;
            case 422:
                throw new Exception("Entidade não processável: ocorreu um erro de validação nos dados enviados.", 422);
                break;
            default:
                throw new Exception("Erro interno do servidor: ocorreu um erro ao processar a solicitação.", 500);
                break;
        }

    }
}