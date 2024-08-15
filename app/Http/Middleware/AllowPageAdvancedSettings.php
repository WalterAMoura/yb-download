<?php

namespace App\Http\Middleware;

use App\Controller\Error\Error;
use App\Http\Request;
use App\Http\Response;
use App\Session\Users\Login as SessionUsersLogin;
use App\Model\Entity\AccessModules as EntityAccessModule;
use Closure;
use Exception;

class AllowPageAdvancedSettings
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
        // Recupera dados de sessão
        $session = SessionUsersLogin::getDataSession();

        $level = $session['usuario']['nivel'];

        $obAccessModules = EntityAccessModule::getAccessModuleByIdByLevelId($level,10);

        $allow = $obAccessModules->allow??false;

        // valida path do usuário é o que ele realmente pode acessar
        if(!$allow){
            throw new Exception(Error::getError($request,403));
        }

        // Continua a execução
        return $next($request);
    }
}