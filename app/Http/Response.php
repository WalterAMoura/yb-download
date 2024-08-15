<?php

namespace App\Http;

class Response
{
    /*
     * Código do status HTTP
     * @var integer
     */
    private $httpCode = 200;

    /*
     * Cabeçalhos do Response
     * @var array
     */
    private $headers = [];

    /*
     * Tipo do conteúdo que está sendo retornado
     * @var string
     */
    private $contentType = 'text/html';

    /*
     * Conteúdo do Response
     * @var mixed
     */
    private $content;

    /*
     * Método responsável por iniciar a classe e definir os valores
     * @param integer $httpCode
     * @param mixed $content
     * @param string $contentType
     */
    public function __construct($httpCode, $content, $contentType ='text/html')
    {
        $this->httpCode = $httpCode;
        $this->content = $content;
        $this->setContentType($contentType);
    }

    /*
     * Método responsável por alterar o content type do response
     * @params string $contentType
     * @return void
     */
    public function setContentType($contentType): void
    {
        $this->contentType = $contentType;
        $this->addHeader('Content-Type', $contentType);

    }

    /*
     * Método responsável por adicionar um registro no nosso cabeçalho
     * @param string $key
     * @param string $value
     * @return void
     */
    public function addHeader($key, $value): void
    {
        $this->headers[$key] = $value;
    }

    /*
     * Método responsável por enviar os headers para o navegador
     * @return void
     */
    private function sendHeaders():void
    {
        // Status Code
        http_response_code($this->httpCode);

        // Enviar Headers
        foreach ($this->headers as $key=>$value){
            header($key . ':' .$value);
        }
    }
    /*
     * Método responsável por enviar a resposta para o usuário
     */
    public function sendResponse(): void
    {
        $this->sendHeaders();
        switch($this->contentType){
            case 'text/html':
                echo $this->content;
                exit;
            case 'application/json':
                echo json_encode($this->content, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
                exit;
        }
    }

}