<?php

namespace App\Session\Users;

use App\Model\Entity\SessionLogin;
use App\Model\Entity\User;
use App\Utils\JWEEncrypt;

class Login
{
    /**
     * Método responsável por iniciar a sessão
     */
    private static function init()
    {
        //Verifica se a sessão não está ativa
        if(session_status() != PHP_SESSION_ACTIVE){
            session_start();
        }
    }

    /**
     * Método responsável por criar o alert do usuário
     * @param User $obUser
     * @param SessionLogin $obSessionLogin
     * @return boolean
     */
    public static function login($obUser, $obSessionLogin)
    {
        // Inicia a sessão
        self::init();

        $jwe = new JWEEncrypt('IASD Parque Regina','IASD Parque Regina', $obUser->id, $obUser->name, $obUser->login, $obSessionLogin->token);

        //Define a sessão do usuário
        $_SESSION[SESSION_NAME]['usuario'] = [
            'id' => $obUser->id,
            'nome' => $obUser->name,
            'email' => $obUser->email,
            'nivel' => $obUser->id_nivel,
            'login' => $obUser->login,
            'pathMain' => $obUser->home_path,
            'token' => $jwe->getEncrypt(),
            'path' => '/application'. $obUser->home_path . '/application'
        ];

        // Definie cookie token
        $cookie_name = "token";
        $cookie_value = $jwe->getEncrypt();
        $cookie_path = '/application'. $obUser->home_path;
        setcookie($cookie_name, $cookie_value, time() + 86400, $cookie_path);

        // Success
        return true;
    }

    /**
     * Método responsável por verificar se usuário está logado
     * @return boolean
     */
    public static function isLogged(): bool
    {
        // Inicia a sessão
        self::init();

        //Retornar a verificação
        return isset($_SESSION[SESSION_NAME]['usuario']['id']);
    }

    /**
     * Método responsável por retornar os dados de sessão do usuário
     * @return array
     */
    public static function getDataSession()
    {
        // Inicia a sessão
        self::init();

        //Retornar a verificação
        return (array)$_SESSION[SESSION_NAME]??[];
    }

    /**
     * Método responsável por executar logout do usuário
     * @param string|null $path
     * @return boolean
     */
    public static function logout(string $path = null)
    {
        // Inicia a sessão
        self::init();

        //Desconectar usuário
        unset($_SESSION[SESSION_NAME]['usuario']);
        unset($_SESSION[SESSION_NAME]['vistante']);


        // Remove cookies
        if (!empty($_COOKIE)) {
            foreach ($_COOKIE as $name => $value) {
                setcookie($name, "",time() - (86400*60), $path);
            }
        }

        //Sucesso
        return true;
    }

    /**
     * Método responsável por verificar se usuário está logado
     * @param integer $id
     * @return boolean
     */
    public static function isTheSameUser($id)
    {
        // Inicia a sessão
        self::init();

        //Retonar a verificação
        return ($_SESSION[SESSION_NAME]['usuario']['id'] == $id) ?? false;
    }

    /**
     * Método responsável por criar a sessão do vistante
     * @param integer $id
     * @return true
     */
    public static function setSessionVisitors($id)
    {
        // Inicia a sessão
        self::init();

        // Criar sessão visitante
        $_SESSION[SESSION_NAME]['vistante'] = [
            'id' => $id
        ];

        return true;
    }
}