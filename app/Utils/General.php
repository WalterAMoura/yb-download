<?php

namespace App\Utils;

class General
{
    /**
     * Método responsável por validar se o conteúdo passado é nulo, vazio ou contém somente espaços
     * @param mixed $str
     * @return bool
     */
    public static function isNullOrEmpty(mixed $str):bool
    {
        if (!isset($str) || trim($str) === '') {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Método responsável por validar se é um array
     * @param $arr
     * @return bool
     */
    public static function isArray($arr) : bool
    {
        if(!is_array($arr) && count($arr) > 0){
            return true;
        }
        return false;
    }

    public static function isValidUrlYouTube($url) : bool
    {
        // Regex para validar URL do YouTube
        $pattern = '/^(https?:\/\/)?(www\.)?(youtube\.com\/(?:watch\?v=|embed\/|v\/|playlist\?list=)|youtu\.be\/)([a-zA-Z0-9_-]{11})$/';

        return preg_match($pattern, $url) === 1;

    }
}