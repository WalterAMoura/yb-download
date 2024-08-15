<?php

namespace App\Controller\Application;

use App\Utils\View;

class Alert
{
    /**
     * Método responsável por retornar uma mensagem de error
     * @param string $message
     * @return string
     */
    public static function getError(string $message): string
    {
        return View::render('application/alert/status',[
            'tipo' => 'danger',
            'mensagem' => $message
        ]);
    }

    /**
     * Método responsável por retornar uma mensagem de sucesso
     * @param string $message
     * @return string
     */
    public static function getSuccess(string $message): string
    {
        return View::render('application/alert/status',[
            'tipo' => 'success',
            'mensagem' => $message
        ]);
    }

    /**
     * Método responsável por retornar uma mensagem de alerta
     * @param string $message
     * @return string
     */
    public static function getWarning(string $message): string
    {
        return View::render('application/alert/status',[
            'tipo' => 'warning',
            'mensagem' => $message
        ]);
    }

}