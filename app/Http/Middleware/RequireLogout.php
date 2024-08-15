<?php

namespace App\Http\Middleware;

use App\Http\Request;
use App\Http\Response;
use App\Session\Users\Login as SessionUsersLogin;
use Closure;

class RequireLogout
{
    /**
     * Método responsável por executar o middleware
     * @param Request $request
     * @param Closure $next
     * @return Response
     */
    public function handle($request, $next)
    {
        // Recupera dados de sessão
        $session = SessionUsersLogin::getDataSession();

        // Veririca se o usuário está logado
        if (SessionUsersLogin::isLogged()) {
            $request->getRouter()->redirect($session['usuario']['pathMain']);
        }

        // Continua a execução
        return $next($request);
    }
}