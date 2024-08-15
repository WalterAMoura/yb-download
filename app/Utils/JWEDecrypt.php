<?php

namespace App\Utils;

use AllowDynamicProperties;
use App\Http\Request;
use Exception;
use Jose\Component\Core\AlgorithmManager;
use Jose\Component\Encryption\Algorithm\KeyEncryption\A256KW;
use Jose\Component\Encryption\Algorithm\ContentEncryption\A256CBCHS512;
use Jose\Component\Encryption\Compression\CompressionMethodManager;
use Jose\Component\Encryption\Compression\Deflate;
use Jose\Component\Encryption\JWE;
use Jose\Component\Encryption\Serializer\CompactSerializer;
use Jose\Component\Core\JWK;
use Jose\Component\Encryption\JWEDecrypter;
use Jose\Component\Encryption\Serializer\JWESerializerManager;
use Jose\Component\Encryption\JWELoader;
use Jose\Component\Checker\HeaderCheckerManager;
use Jose\Component\Checker\AlgorithmChecker;
use Jose\Component\Encryption\JWETokenSupport;

class JWEDecrypt
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
     * @var JWEDecrypter
     */
    private JWEDecrypter $jweDecrypter;

    /**
     * @var JWESerializerManager
     */
    private JWESerializerManager $serializerManager;

    /**
     * @var HeaderCheckerManager
     */
    private HeaderCheckerManager $headerCheckerManager;

    /**
     * @var JWELoader
     */
    private JWELoader $jweLoader;

    /**
     * @var bool
     */
    private bool $success;

    /**
     * @var JWE
     */
    private JWE $jwe;

    /**
     * @var string
     */
    private string $jwt;

    /**
     * @var JWE
     */
    private JWE $contentDecrypt;

    /**
     * @param string $jwt
     * @param Request $request
     * @throws Exception
     */
    public function __construct(string $jwt, Request $request)
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

        $this->jweDecrypter = new JWEDecrypter(
            $this->keyEncAlgManager,
            $this->contEncAlgManager,
            $this->compMethodManager
        );

        $this->jwk = new JWK([
            'kty' => $this->kty,
            'k' => $this->key
        ]);

        $this->jwt = $jwt;

        try {
            $this->dencrypt();
        }catch (Exception $e){
            // Altera o content type para json
            $request->getRouter()->setContentType('application/json');
            throw new Exception("Acesso negado: " . $e->getMessage(), 403);
        }
    }

    private function dencrypt()
    {
        $this->serializerManager = new JWESerializerManager([
            new CompactSerializer()
        ]);

        $this->jwe = $this->serializerManager->unserialize($this->jwt);
        $this->success = $this->jweDecrypter->decryptUsingKey($this->jwe,$this->jwk,0);

    }

    /**
     * @return mixed
     */
    public function getDencrypt(): mixed
    {
        if($this->success){
            $this->headerCheckerManager = new HeaderCheckerManager(
                [
                    new AlgorithmChecker(['A256KW']),
                ],
                [
                    new JWETokenSupport(),
                ]
            );
            $this->jweLoader = new JWELoader(
                $this->serializerManager,
                $this->jweDecrypter,
                $this->headerCheckerManager
            );
            $this->contentDecrypt = $this->jweLoader->loadAndDecryptWithKey($this->jwt, $this->jwk,$recipient);
            return json_decode($this->contentDecrypt->getPayload());
        }else{
            return $this->success;
        }
    }
}