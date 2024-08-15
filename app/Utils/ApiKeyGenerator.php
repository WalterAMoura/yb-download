<?php

namespace App\Utils;

class ApiKeyGenerator
{

    private $timestamp;

    private $apiKey;

    /**
     * Método responsável por instanciar a classe
     */
    public function __construct()
    {
        $this->timestamp = time();
        $this->generateApiKey();
    }

    /**
     * @return void
     */
    private function generateApiKey()
    {
        $randomChars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $randomString = '';

        // Gerar uma sequência aleatória de 16 caracteres
        for ($i = 0; $i < 16; $i++) {
            $index = mt_rand(0, strlen($randomChars) - 1);
            $randomString .= $randomChars[$index];
        }

        // Concatenar o timestamp com a sequência aleatória
        $apiKeyString = $this->timestamp . $randomString;

        // Aplicar hash SHA-256
        $hashedApiKey = hash('sha256', $apiKeyString);

        // Atribuir os primeiros 32 caracteres do hash como a chave de API
        $this->apiKey = substr($hashedApiKey, 0, 32);
    }

    public function getApiKey()
    {
        return $this->apiKey;
    }
}
