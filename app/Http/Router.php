<?php

namespace App\Http;
use App\Utils\Debug;
use Closure;
use Exception;
use ReflectionFunction;
use App\Http\Middleware\Queue as MiddlewareQueue;
use App\Controller\Error\Error;

class Router
{
    /**
     * URL completa do projeto (raiz)
     * @var string
     */
    private $url = '';

    /**
     * Prefixo de todas as rotas
     * @var string
     */
    private $prefix = '';

    /**
     * Path aplicação todas as urls sem o sufixo
     * @var string
     */
    private $path_user = '';

    /**
     * Path main todas as urls sem o sufixo
     * @var string
     */
    private $path_main = '';

    /**
     * Índice de rotas
     * @var array
     */
    private $routes = [];

    /**
     * Instancia de Request
     * @var Request
     */
    private $request;

    /**
     * Content type padrão do response
     * @var string
     */
    private $contentType = 'text/html';

    /**
     * Método responsável por iniciar a classe
     * @param string $url
     */
    public function __construct($url)
    {
        $this->request = new Request($this);
        $this->url = $url;
        $this->setPrefix();
        $this->setPathUser();
        $this->setPathMain();
    }

    /**
     * Método responsável por alterar o valor do contet-type
     * @param string $contentType
     * @return void
     */
    public function setContentType($contentType)
    {
        $this->contentType = $contentType;
    }

    /**
     * Método responsável por definir o prefixo das rotas
     * @return void
     */
    private function setPrefix(): void
    {
        $parseUrl = parse_url($this->url);

        // Define o prefixo
        $this->prefix = $parseUrl['path'] ?? '';

    }

    /**
     * Método responsável por definir o path da aplicação sem o prefixo das rotas
     * @return void
     */
    private function setPathUser(): void
    {
        $uri = $this->getURI();
        $uri = explode('/',$uri);

        // Define o path do usuário
        $this->path_user = '/'.$uri['1'] ?? '';
    }

    /**
     * Método responsável por definir o path completo da aplicação sem o prefixo das rotas
     * @return void
     */
    private function setPathMain(): void
    {
        $uri = $this->getURI();

        // Define o path do usuário
        $this->path_main = $uri;
    }

    /**
     * Método responsável por adicionar uma rota na classe
     * @param string $method
     * @param string $route
     * @param array $params
     * @return void
     */
    private function addRoute($method, $route, $params = []):void
    {
        // Validação dos parâmetros
        foreach($params as $key=>$value){
            if($value instanceof Closure){
                $params['controller'] = $value;
                unset($params[$key]);
                continue;
            }
        }

        // Middlewares da rota
        $params['middlewares'] = $params['middlewares'] ?? [];

        //Variáveis da rota
        $params['variables'] = [];

        //Padrão de validação das variáveis das rotas
        //$patternVariable = '/{(.*?)}/';
        $patternVariable = '/{([^\/]*)}(?=\/|$)/';

        if(preg_match_all($patternVariable,$route,$matches)){
            //$route = preg_replace($patternVariable,'(.*?)',$route);
            $route = preg_replace($patternVariable, '([^/]+)/?', $route);
            $params['variables'] = $matches[1];
        }

        // Padrão de validação da (URL)
        //$patternRoute = '/^'.str_replace('/','\/', $route).'$/';
        $patternRoute = '/^'.str_replace('/','\/', $route).'$/';

        // Adiciona a rota dentro da classe
        $this->routes[$patternRoute][$method] = $params;

    }


    /**
     * Método responsável por defirnir uma rota de GET
     * @param string $route
     * @param array $params
     */
    public function get($route, $params = [])
    {
        return $this->addRoute('GET', $route, $params);
    }

    /**
     * Método responsável por definir uma rota de POST
     * @param string $route
     * @param array $params
     */
    public function post($route, $params = [])
    {
        return $this->addRoute('POST', $route, $params);
    }

    /**
     * Método responsável por definir uma rota de PUT
     * @param string $route
     * @param array $params
     */
    public function put($route, $params = [])
    {
        return $this->addRoute('PUT', $route, $params);
    }

    /**
     * Método responsável por definir uma rota de DELETE
     * @param string $route
     * @param array $params
     */
    public function delete($route, $params = [])
    {
        return $this->addRoute('DELETE', $route, $params);
    }

    /**
     * Método responsável por retornar a URI desconsiderando o prefixo
     * @return string
     */
    private function getURI():string
    {
        // URI request
        $uri = $this->request->getURI();

        // Split URI
        $xUri = strlen($this->prefix) ? explode($this->prefix, $uri) : [$uri];

        // Retorna a URI sem prefixo
        return rtrim(end($xUri),'/');


    }

    /**
     * Método responsável por retornar os dados da rota atual
     * @return array
     * @throws
     */
    private function getRoute():array
    {
        //URI
        $uri = $this->getURI();

        // Method
        $httpMethod = $this->request->getHttpMethod();

        // Valida as rotas
        foreach ($this->routes as $patternRoute=>$methods){
            // Verifica se a URI bate com o padrão
            if(preg_match($patternRoute,$uri,$matches)){

                // Verifica o method
                if(isset($methods[$httpMethod])){
                    // Remove a primeira item posição
                    unset($matches[0]);

                    // Variáveis processadas
                    $keys = $methods[$httpMethod]['variables'];
                    $methods[$httpMethod]['variables'] = array_combine($keys,$matches);
                    $methods[$httpMethod]['variables']['request'] = $this->request;

                    // Retorno dos parâmetros da rota
                    return $methods[$httpMethod];
                }
                // Método não permitido/definido
                throw new Exception(Error::getError($this->request,405));
            }
        }
        //throw new Exception("URL não encontrado", 404);
        throw new Exception(Error::getError($this->request,404));
    }

    /**
     * Método responsável por executar a rota atual
     * @return Response
     */
    public function run(): Response
    {
        try {
            $route = $this->getRoute();

            // verifica o controlador
            if(!isset($route['controller'])){
                throw new Exception(Error::getError($this->request,500));
            }

            // Argumentos da função
            $args = [];

            //Reflection

            $reflection = new ReflectionFunction($route['controller']);
            foreach ($reflection->getParameters() as $parameters){
                $name = $parameters->getName();
                $args[$name] = $route['variables'][$name] ?? '';
            }

            // Retorna a execução da fila de Middlewares
            return (new MiddlewareQueue($route['middlewares'],$route['controller'],$args))->next($this->request);

        }catch (Exception $e){
            return new Response($e->getCode(),$this->getErrorMesssage($e->getMessage()), $this->contentType);
        }
    }

    /**
     * Método responsável por retonar a mensagem de erro de acordo com content type
     * @param string $message
     * @return mixed
     */
    private function getErrorMesssage($message)
    {
        switch ($this->contentType){
            case 'application/json':
                return [
                    'error' => $message
                ];
                break;
            default:
                return $message;
                break;
        }
    }

    /**
     * Método responsável por retornar o URL corrente
     * @return string
     */
    public function getCurrentUrl()
    {
        return $this->url.$this->getURI();
    }

    /**
     * Método responsável por retornar a uri sem sufixo
     * @return string
     */
    public function getPathMain()
    {
        return $this->path_main;
    }

    /**
     * Método responsável por redirecionar a URL
     * @param string $route
     */
    public function redirect($route)
    {
        //URL
        $url = $this->url.$route;

        //Executa o redirect
        header('Location: '.$url);
        exit;
    }

}