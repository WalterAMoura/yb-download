<?php

namespace App\Session;

class Session
{
    /**
     * Método responsável por iniciar a sessão
     */
    private static function init(): void
    {
        //Verifica se a sessão não está ativa
        if(session_status() != PHP_SESSION_ACTIVE){
            session_start();
        }
    }

    /**
     * Método responsável por criar a sessão de percentual
     * @param $percent
     * @return true
     */
    public static function setSessionProgress($percent): true
    {
        // Inicia a sessão
        self::init();

        // Criar sessão visitante
        $_SESSION[SESSION_NAME]['download_progress'] = [
            'percent' => $percent
        ];

        return true;
    }


    /**
     * Método responsável por retornar os dados de sessão do usuário
     * @return array
     */
    public static function getDataSession(): array
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
    public static function destroy(string $path = null): bool
    {
        // Inicia a sessão
        self::init();

        //Desconectar usuário
        unset($_SESSION[SESSION_NAME]);


        // Remove cookies
        if (!empty($_COOKIE)) {
            foreach ($_COOKIE as $name => $value) {
                setcookie($name, "",time() - (86400*60), $path);
            }
        }

        //Sucesso
        return true;
    }
}