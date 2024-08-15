<?php

namespace App\Http\Middleware;

use App\Controller\Error\Error;
use App\Http\Request;
use App\Http\Response;
use App\Session\Users\Login as SessionUsersLogin;
use Closure;
use Exception;

class RequireLogin
{
    /**
     * Método responsável por executar o middleware
     * @param Request $request
     * @param Closure $next
     * @return Response
     * @throws Exception
     */
    public function handle($request, $next)
    {
        // Recuperar queryParams
        $queryParams = $request->getQueryParams();

        // recupera status
        $status = $queryParams['status'] ?? '';

        // Verifica se o usuário está logado
        if (!SessionUsersLogin::isLogged()) {
            ($status == '')?$request->getRouter()->redirect('/login') : $request->getRouter()->redirect('/login?status=logout');
        }

        // Recupera dados de sessão
        $session = SessionUsersLogin::getDataSession();

        // valida path do usuário é o que ele realmente pode acessar
        if($session['usuario']['pathMain'] != $request->getPathUser()){
            throw new Exception(Error::getError($request,403));
        }

        // Continua a execução
        return $next($request);
    }
}