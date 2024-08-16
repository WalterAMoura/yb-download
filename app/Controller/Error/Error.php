<?php

namespace App\Controller\Error;

use App\Controller\Error\Page;
use App\Http\Request;
use App\Model\Entity\Organization as EntityOrganization;
use App\Utils\Debug;
use App\Utils\View;
use Exception;

class Error extends Page
{
    /**
     * Método responsável por renderizar a view da home do painel
     * @param Request $request
     * @param integer|string $code
     * @param string $type
     * @return string
     * @throws Exception
     */
    public static function getError(Request $request, int|string $code, string $type = 'Error'): string
    {
        $obOrganization = new EntityOrganization();
        $urlRedirect = URL;

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
        throw match ($code) {
            400 => new Exception("Requisição inválida: ocorreu um erro nos dados enviados.", 400),
            401 => new Exception("Não autorizado: você não possui permissão para acessar este recurso.", 401),
            403 => new Exception("Acesso proibido: você não tem permissão para acessar este recurso.", 403),
            404 => new Exception("Recurso não encontrado: a página ou o recurso solicitado não foi encontrado.", 404),
            405 => new Exception("Método não permitido: o método de solicitação não é suportado para este recurso.", 405),
            422 => new Exception("Entidade não processável: ocorreu um erro de validação nos dados enviados.", 422),
            default => new Exception("Erro interno do servidor: ocorreu um erro ao processar a solicitação.", 500),
        };

    }
}