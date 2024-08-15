<?php

namespace App\Utils;

class Debug
{
    /**
     * @param $message
     * @return void
     */
    public static function debug($message):void
    {
        echo "<pre>";
        print_r($message);
        echo "</pre>";exit;
    }
}