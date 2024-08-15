<?php

namespace App\Http\Middleware;

use App\Http\Request;
use App\Http\Response;
use App\Session\Users\Login as SessionUsersLogin;
use Closure;

class SessionOpen
{
    /**
     * Método responsável por executar o middleware
     * @param Request $request
     * @param Closure $next
     * @return Response
     */
    public function handle($request, $next)
    {
        // Verifica se o usuário está logado
        if (!SessionUsersLogin::isLogged()) {
            return new Response(200, [ 'path' => URL . '/login?status=logout', 'success' => false ],'application/json');
        }

        // Continua a execução
        return $next($request);
    }
}