<?php

namespace App\Session\Error;

use App\Model\Entity\SessionLogin;
use App\Model\Entity\User;
use App\Utils\JWEEncrypt;

class Error
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
     * Método responsável por criar a sessão de erro
     * @param $msgError
     * @return true
     */
    public static function setSessionMsgError($msgError)
    {
        // Inicia a sessão
        self::init();

        // Cria sessão com mensagem de erro
        $_SESSION[SESSION_NAME]['error'] = [
            'msg' => $msgError
        ];

        return true;
    }
}