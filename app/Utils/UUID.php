<?php

namespace App\Utils;

class UUID
{
    /**
     * @var string
     */
    private string $uuid;


    /**
     * Método responsável por instanciar a classe
     */
    public function __construct()
    {
        $this->setUUID();
    }

    /**
     * Método responsável por criar um uuid
     * @return void
     */
    private function setUUID():void
    {
        mt_srand((double)microtime()*10000);
        $charid = strtoupper(md5(uniqid(rand(), true)));
        $hyphen = chr(45);// "-"
        $uuid = ""
            .substr($charid, 0, 8).$hyphen
            .substr($charid, 8, 4).$hyphen
            .substr($charid,12, 4).$hyphen
            .substr($charid,16, 4).$hyphen
            .substr($charid,20,12);
        $this->uuid = $uuid;
    }

    /**
     * Método responsável por retornar o uuid
     * @return string
     */
    public function getUUID(): string
    {
        return $this->uuid;
    }
}