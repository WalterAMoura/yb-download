<?php

namespace App\Http\Middleware;

use App\Http\Request;
use App\Http\Response;
use App\Utils\Debug;
use App\Utils\General;
use App\Model\Entity\ApiKey as EntityApikey;
use Closure;
use Exception;

class RequireApikey
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
        // recuperar headers
        $heardersVars = $request->getHeaders();
        $apikey = $heardersVars['x-api-key'];
        $path = $request->getRouter()->getPathMain();
        //Debug::debug($apikey);

        // Valida se existe o header x-api-key
        if(General::isNullOrEmpty($heardersVars['x-api-key'])){
            throw new Exception("No API key found in request.",401);
        }

        // valida se existe a apikey informada para este path
        $obApikey = EntityApikey::getApikeyByKeyByPath($apikey,$path);

        // valida se está apikey tem permissão para acessar
        if($obApikey->status_id !== 1){
            throw new Exception("Invalid authentication credentials.",401);
        }

        //Executa o próximo nível do middleware
        return $next($request);

    }
}