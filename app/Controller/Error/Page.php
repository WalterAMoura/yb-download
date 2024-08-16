<?php

namespace App\Controller\Error;

use App\Utils\View;

class Page
{
    /**
     * Método responsável por retornar o conteúdo da estrutura de páginas do painel
     * @param string $title
     * @param string  $content
     * @return string
     */
    public static function getPage($title,$content)
    {
        return View::render('error/page', [
            'title' => $title,
            'content' => $content
        ]);
    }
}