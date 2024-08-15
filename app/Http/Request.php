<?php

namespace App\Http;

use App\Model\Entity\User;
use App\Utils\Debug;

class Request
{
    /**
     * Instancia do Router
     * @var Router
     */
    private $router;

    /**
     * Método HTTP da requisição
     * @var string
     */
    private $httpMethod;

    /**
     * URI da página
     * @var string
     */
    private $uri;

    /**
     * Retorna o path do usuário
     * @var string
     */
    private $path_user;

    /**
     * Parametros da URL ($_GET)
     * @var array
     */
    private $queryParams = [];

    /**
     * Varáveis recebidas no posta da página ($_POST)
     * @var array
     */
    private $postVars = [];

    /**
     * Cabeçalhos da requisição
     * @var array
     */
    private $herders = [];

    /**
     * @var User
     */
    private $user;
    /**
     * Construtor da classe
     */
    public function __construct($router)
    {
        $this->router = $router;
        $this->queryParams = $_GET ?? [];
        $this->herders = getallheaders();
        $this->httpMethod = $_SERVER['REQUEST_METHOD'];
        $this->uri = $_SERVER['REQUEST_URI'];
        $this->setUri();
        $this->setPostVars();
        $this->setPathMain();
    }

    /**
     * Método responsável por definir as váriaveis do post
     * @return void
     */
    private function setPostVars() : void
    {
        // Verifica o método da requisição
        if($this->httpMethod == 'GET') {
            return;
        }

        // POST padrão
        $this->postVars = $_POST ?? [];

        //POST Json
        $inputRaw = file_get_contents('php://input');
        $this->postVars = (strlen($inputRaw) && empty($_POST))? json_decode($inputRaw, true) : $this->postVars;

    }

    /**
     * Método responsável por definir a URI
     * @return void
     */
    private function setUri()
    {
        // URI completa
        $this->uri = $_SERVER['REQUEST_URI'];

        // Remove QueryParams
        $xURI = explode('?',$this->uri);
        $this->uri = $xURI[0];
    }

    /**
     * Método responsável por definir o prefixo das rotas
     * @return void
     */
    private function setPathMain(): void
    {
        // URI completa
        $xURI = $this->getURI();

        // Remove QueryParams
        $uri = explode('?',$xURI);

        // splita por barrar
        $uri = explode('/',$uri[0]);

        // Define o path do usuário
        $this->path_user = '/'.$uri['2'] ?? '';
    }

    /**
     * Método para retornar o a instancia de Router
     * @return Router
     */
    public function getRouter()
    {
        return $this->router;
    }

    /**
     * Método responsável por retornar o método HTTP da requisição
     * @return string
     */
    public function getHttpMethod():string
    {
        return $this->httpMethod;
    }

    /**
     * Método responsável por retornar o método URI da requisição
     * @return string
     */
    public function getURI():string
    {
        return $this->uri;
    }

    /**
     * Método responsável por retornar a path do usuário
     * @return string
     */
    public function getPathUser():string
    {
        return $this->path_user;
    }

    /**
     * Método responsável por retornar os headers da requisição
     * @return array
     */
    public function getHeaders():array
    {
        return $this->herders;
    }

    /**
     * Método responsável por retornar os parâmetros da (URL) da requisição
     * @return array
     */
    public function getQueryParams():array
    {
        return $this->queryParams;
    }

    /**
     * Método responsável por retornar as varáveis $_POST da requisição
     * @return array
     */
    public function getPostVars():array
    {
        return $this->postVars;
    }

    /**
     * Método responsável por criar o user na request
     * @param User $user
     * @return void
     */
    public function setUser(User $user): void
    {
        $this->user = $user;
    }
}