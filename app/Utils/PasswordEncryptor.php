<?php

namespace App\Utils;

class PasswordEncryptor
{
    /**
     * Chave de criptografia
     * Certifique-se de usar uma chave segura e mantenha-a em um local seguro
     * @var string
     */
    private static $key = '48V+wzyKXDiPBNaAlZiD3l/CY3nd9kyEzAoqjM0l1PY=';

    /**
     * Método responsável por criptografar uma senha
     * @param string $password Senha a ser criptografada
     * @return string Senha criptografada
     */
    public static function encryptPassword($password)
    {
        $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length('aes-256-cbc'));
        $encrypted = openssl_encrypt($password, 'aes-256-cbc', self::$key, 0, $iv);
        return base64_encode($encrypted . '::' . $iv);
    }

    /**
     * Método responsável por descriptografar uma senha
     * @param string $encryptedPassword Senha criptografada
     * @return string|null Senha descriptografada ou null se houver algum erro na descriptografia
     */
    public static function decryptPassword($encryptedPassword)
    {
        $parts = explode('::', base64_decode($encryptedPassword), 2);
        if (count($parts) === 2) {
            list($encrypted, $iv) = $parts;
            $decrypted = openssl_decrypt($encrypted, 'aes-256-cbc', self::$key, 0, $iv);
            if ($decrypted !== false) {
                return $decrypted;
            }
        }
        return null;
    }
}