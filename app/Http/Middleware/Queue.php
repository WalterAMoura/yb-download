<?php

namespace App\Http\Middleware;


use App\Http\Request;
use App\Http\Response;
use Exception;

class Queue
{

    /**
     * Mapeamento de middlewares
     * @var array
     */
    private static $map = [];

    /**
     * Mapeamento de middlewares que serão carregados em todas as rotas
     * @var array
     */
    private static $default = [];
    /**
     * Fila de middlewares a serem executados
     * @var array
     */
    private $middlewares = [];

    /**
     * Função de execução do controlador
     * @var Closure
     */
    private  $controller;

    /**
     * Argumentos da função do controlador
     * @var array
     */
    private $controllerArgs = [];

    /**
     * Método responsável por construir a classe de fila de middlewares
     * @param array $middleware
     * @param Closure $controller
     * @param array $controllerArgs
     */
    public function __construct($middleware, $controller, $controllerArgs)
    {
        $this->middlewares = array_merge(self::$default,$middleware);
        $this->controller = $controller;
        $this->controllerArgs = $controllerArgs;
    }

    /**
     * Método responsável por definir o mapeamento de middlewares
     * @param $map
     */
    public static function setMap($map)
    {
        self::$map = $map;
    }

    /**
     * @param $default
     * @return void
     */
    public static function setDefault($default)
    {
        self::$default = $default;
    }

    /**
     * Método responsável por executar o próxima nível da fila
     * @param Request $request
     * @return Response
     * @throws Exception
     */
    public function next($request)
    {
        // Verifica se a fila está vazia
        if(empty($this->middlewares)) return call_user_func_array($this->controller, $this->controllerArgs);

        //Middleware
        $middleware = array_shift($this->middlewares);

        // Verifica o mapeamento
        if(!isset(self::$map[$middleware])){
            throw new Exception("Problemas ao processar o middleware da requisição.",500);
        }

        // Next, cria uma função anônima que chama ele mesmo para próximo middleware da fila
        $queue = $this;
        $next = function ($request) use($queue){
            return $queue->next($request);
        };

        // Executa o middleware
        return (new self::$map[$middleware])->handle($request, $next);
    }
}