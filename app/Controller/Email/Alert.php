<?php

namespace App\Controller\Email;

use App\Utils\View;

class Alert
{
    /**
     * Método responsável por retornar uma mensagem de error
     * @param string $message
     * @return string
     */
    public static function getError($message)
    {
        return View::render('alert/status',[
            'tipo' => 'danger',
            'mensagem' => $message
        ]);
    }

    /**
     * Método responsável por retornar uma mensagem de sucesso
     * @param string $message
     * @return string
     */
    public static function getSuccess($message)
    {
        return View::render('alert/status',[
            'tipo' => 'success',
            'mensagem' => $message
        ]);
    }

    /**
     * Método responsável por retornar uma mensagem de warning
     * @param string $message
     * @return string
     */
    public static function getWarning($message)
    {
        return View::render('alert/status',[
            'tipo' => 'warning',
            'mensagem' => $message
        ]);
    }

}