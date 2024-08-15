<?php

namespace App\Utils;

class ViewJS
{
    /**
     * Variáveis padrão da View
     * @var array
     */
    private static $vars = [];

    /**
     * Método responsável por definir os dados inicias da classe
     * @param array $vars
     */
    public static function init($vars = [])
    {
        self::$vars = $vars;
    }

    /*
    * Método responsável por retornar o conteúdo de uma view
    * @param string $view
    * @return string
    */
    private static function getContentView($view):string
    {
        $file = __DIR__ . '/../../resources/view/' . $view . '.js';
        return file_exists($file) ? file_get_contents($file) : '';
    }

    /*
     * Método responsável por retornar o conteúdo renderizado de uma view
     * @param string $view
     * @param array $vars (string/numeric)
     * @return string
     */
    public static function render($view, $vars = []):string
    {
        //Conteúdo da view
        $contentView = self::getContentView($view);

        //Merge de variáveis do layout
        $vars = array_merge(self::$vars,$vars);

        // Chaves array de variáveis
        $keys = array_keys($vars);
        $keys = array_map(function($item){
            return '{{'.$item.'}}';
        }, $keys);

        //Retorna os conteúdos renderizados
        return str_replace($keys, array_values($vars),$contentView);
    }
}