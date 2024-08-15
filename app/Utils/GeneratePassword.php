<?php

namespace App\Utils;

class GeneratePassword extends PasswordEncryptor
{
    /**
     * Gera uma senha aleatória com um certo nível de complexidade
     * @param int $length Tamanho da senha
     * @return string Senha gerada
     */
    public static function generatePassword($length = 10)
    {
        // Define os caracteres permitidos em cada categoria
        $uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
        $numbers = '0123456789';
        $symbols = '!@#$%^&*()-_=+[{]}\|;:,<.>/';

        // Cria um pool de caracteres combinando todas as categorias
        $pool = $uppercaseLetters . $lowercaseLetters . $numbers . $symbols;

        // Inicializa a senha como uma string vazia
        $password = '';

        // Gera a senha aleatória selecionando caracteres do pool
        for ($i = 0; $i < $length; $i++) {
            $randomIndex = mt_rand(0, strlen($pool) - 1);
            $password .= $pool[$randomIndex];
        }

        return PasswordEncryptor::encryptPassword($password);
    }
}