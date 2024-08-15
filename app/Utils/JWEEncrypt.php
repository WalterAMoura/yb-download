<?php

namespace App\Utils;

use Exception;
use Jose\Component\Core\AlgorithmManager;
use Jose\Component\Encryption\Algorithm\KeyEncryption\A256KW;
use Jose\Component\Encryption\Algorithm\ContentEncryption\A256CBCHS512;
use Jose\Component\Encryption\Compression\CompressionMethodManager;
use Jose\Component\Encryption\Compression\Deflate;
use Jose\Component\Encryption\JWEBuilder;
use Jose\Component\Encryption\Serializer\CompactSerializer;
use Jose\Component\Core\JWK;

class JWEEncrypt
{
    /**
     * Chave de encriptação
     * @var string
     */
    private string $kty = 'oct';

    /**
     * @var string
     */
    private string $key = 'dzI6nbW4OcNF-AtfxGAmuyz7IpHRudBI0WgGjZWgaRJt6prBn3DARXgUR8NVwKhfL43QBIU2Un3AvCGCHRgY4TbEqhOi8-i98xxmCggNjde4oaW6wkJ2NgM3Ss9SOX9zS3lcVzdCMdum-RwVJ301kbin4UtGztuzJBeg5oVN00MGxjC2xWwyI0tgXVs-zJs5WlafCuGfX1HrVkIf5bvpE0MQCSjdJpSeVao6-RSTYDajZf7T88a2eVjeW31mMAg-jzAWfUrii61T_bYPJFOXW8kkRWoa1InLRdG6bKB9wQs9-VdXZP60Q4Yuj_WZ-lO7qV9AEFrUkkjpaDgZT86w2g';

    /**
     * @var int
     */
    private int $iat;

    /**
     * @var int
     */
    private int $nbf;

    /**
     * @var int
     */
    private int $exp;

    /**
     * @var string
     */
    private string $iss;

    /**
     * @var string
     */
    private string $aud;

    /**
     * @var int
     */
    private int $id;

    /**
     * @var string
     */
    private string $user;

    /**
     * @var string
     */
    private string $login;

    /**
     * @var array
     */
    private array $customsScopes;

    /**
     * @var string
     */
    private string $token;

    /**
     * @var string
     */
    private string $alg = 'A256KW';

    /**
     * @var string
     */
    private string $enc = 'A256CBC-HS512';

    /**
     * @var string
     */
    private string $zip = 'DEF';

    /**
     * @var AlgorithmManager
     */
    private AlgorithmManager $keyEncAlgManager;

    /**
     * @var AlgorithmManager
     */
    private AlgorithmManager $contEncAlgManager;

    /**
     * @var CompressionMethodManager
     */
    private CompressionMethodManager $compMethodManager;

    /**
     * @var JWK
     */
    private JWK $jwk;

    /**
     * @var JWEBuilder
     */
    private JWEBuilder $jweBuilder;

    /**
     * @var false|string
     */
    private false|string $payload;

    /**
     * @var string
     */
    private string $jwt;

    /**
     * @param string $iss
     * @param string $aud
     * @param int $id
     * @param string $user
     * @param string $login
     * @param string $token
     * @param array $customsScopes
     * @param string|int $expirationSeconds
     */
    public function __construct(string $iss, string $aud, int $id, string $user, string $login, string $token, array $customsScopes = [], string|int $expirationSeconds = 3600)
    {
        $this->keyEncAlgManager = new AlgorithmManager([
            new A256KW(),
        ]);
        $this->contEncAlgManager = new AlgorithmManager([
            new  A256CBCHS512(),
        ]);
        $this->compMethodManager = new CompressionMethodManager([
            new Deflate()
        ]);
        $this->jweBuilder = new JWEBuilder(
            $this->keyEncAlgManager,
            $this->contEncAlgManager,
            $this->compMethodManager
        );

        $this->jwk = new JWK([
            'kty' => $this->kty,
            'k' => $this->key
        ]);

        $this->iat = time();
        $this->nbf = time();
        $this->exp = time()+$expirationSeconds;
        $this->iss = $iss;
        $this->aud = $aud;
        $this->id = $id;
        $this->user = $user;
        $this->login = $login;
        $this->token = $token;
        $this->customsScopes = $customsScopes;
        $this->encrypt();

    }

    private function encrypt()
    {
        $this->payload = json_encode([
            'iat' => $this->iat,
            'nbf' => $this->nbf,
            'exp' => $this->exp,
            'iss' => $this->iss,
            'aud' => $this->aud,
            'id' => $this->id,
            'user' => $this->user,
            'login' => $this->login,
            'token' => $this->token,
            'customScopes' => $this->customsScopes
        ]);

        $jwe = $this->jweBuilder
            ->create()
            ->withPayload($this->payload)
            ->withSharedProtectedHeader([
                'alg' => $this->alg,
                'enc' => $this->enc,
                'zip' => $this->zip
            ])
            ->addRecipient($this->jwk)
            ->build();
        $serializer = new CompactSerializer();
        $this->jwt = $serializer->serialize($jwe, 0);
    }

    /**
     * @return string
     */
    public function getEncrypt(): string
    {
        return (string)$this->jwt;
    }

}