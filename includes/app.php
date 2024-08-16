<?php
require __DIR__ . '/../vendor/autoload.php';


use App\Utils\View;
use App\Utils\Environment;
use App\Http\Middleware\Queue as MiddlewareQueue;

//Carrega variáveis de ambiente
Environment::load(__DIR__ . '/../../config/env/yb-download/');


// Define a constante de URL do projeto
define("URL", getenv('URL'));
define("PATH_MAIN", getenv('PATH_MAIN'));
define("PATH_LOGO_PNG", getenv('PATH_LOGO_PNG'));
define("PATH_LOGO_ICO", getenv('PATH_LOGO_ICO'));
define("PATH_LOGO_PNG_IASD", getenv('PATH_LOGO_PNG_IASD'));
\App\Utils\Debug::debug(URL);
//Define valor padrão das variáveis
View::init([
    'URL' => URL,
    'MAIN_PATH_APP' => PATH_MAIN,
    'PATH_LOGO_PNG' => PATH_LOGO_PNG,
    'PATH_LOGO_ICO' => PATH_LOGO_ICO,
    'PATH_LOGO_PNG_IASD' => PATH_LOGO_PNG_IASD
]);

//Define o mapeamento de middlewares

MiddlewareQueue::setMap([
    'maintenance' => \App\Http\Middleware\Maintenance::class
]);

MiddlewareQueue::setDefault([
    'maintenance'
]);
