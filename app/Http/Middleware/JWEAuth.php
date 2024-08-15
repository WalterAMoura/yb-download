<?php

namespace App\Http\Middleware;

use App\Http\Request;
use App\Http\Response;
use App\Model\Entity\User;
use Closure;
use Exception;
use App\Utils\JWEDecrypt;

class JWEAuth
{
    /**
     * Método responsável por retornar uma instância de usuário autenticado
     * @param Request $request
     * @return bool|User
     * @throws Exception
     */
    private function getJWTAuthUser(Request $request): bool | User
    {
        $headers = $request->getHeaders();

        $jwt = isset($headers['Authorization']) ? str_replace('Bearer ','',$headers['Authorization']): '';

        $decrypt = new JWEDecrypt($jwt, $request);
        $decode = (array)$decrypt->getDencrypt();

        $now = strtotime("now");

        // Check token expiration
        if($now >= $decode['exp'] ) return false;

        $login = $decode['login'] ?? '';

        //Busca o usuário pelo login
        $obUser = User::getUserByLogin($login);

        return $obUser instanceof User ? $obUser : false;
    }

    /**
     * Método responsável por validar o acesso via jwt
     * @param Request $request
     * @return void
     * @throws Exception
     */
    private function auth(Request $request): void
    {
        //Responsável por retornar uma instância de usuário
        if($obUser = $this->getJWTAuthUser($request)){
            $request->setUser($obUser);
            return;
        }

        // Altera o content type para json
        $request->getRouter()->setContentType('application/json');
        // Imprimi o erro de usuário ou senha inválida
        throw new Exception("Acesso negado", 403);
    }

    /**
     * Método responsável por executar o middleware
     * @param Request $request
     * @param Closure $next
     * @return Response
     * @throws Exception
     */
    public function handle(Request $request, Closure $next): Response
    {
        //Realiza a validação do acesso via basic auth
        $this->auth($request);

        //Executa o próximo nivel do middleware
        return $next($request);

    }
}