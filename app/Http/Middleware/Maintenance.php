<?php

namespace App\Http\Middleware;

use App\Controller\Error\Error;
use App\Http\Request;
use App\Http\Response;
use Closure;
use Exception;

class Maintenance
{
    /**
     * Método responsável por executar o middleware
     * @param Request $request
     * @param Closure $next
     * @return Response
     * @throws Exception
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Verifica o estado de manutenção da página
        if(getenv('MAINTENANCE') == 'true'){
            //throw new Exception("Página em manutenção. Tente novamente mais tarde.", 200);
            throw new Exception(Error::getError($request,200, 'Maintenance'));
        }

        //Executa o próximo nivel do middleware
        return $next($request);

    }
}