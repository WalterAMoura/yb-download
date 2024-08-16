<?php
require __DIR__ . '/../vendor/autoload.php';


use App\Utils\View;
use App\Utils\Environment;
use App\Http\Middleware\Queue as MiddlewareQueue;

//Carrega variáveis de ambiente
Environment::load(__DIR__ . '/../');


// Define a constante de URL do projeto
define("URL", getenv('URL'));
define("PATH_MAIN", getenv('PATH_MAIN'));
define("PATH_LOGO_PNG", getenv('PATH_LOGO_PNG'));
define("PATH_LOGO_ICO", getenv('PATH_LOGO_ICO'));
define("PATH_LOGO_PNG_IASD", getenv('PATH_LOGO_PNG_IASD'));
define("PATH_DOWNLOAD", getenv('PATH_DOWNLOAD'));
const BIN_YT_DLP = __DIR__ . '/../bin/yt-dlp';
//Define valor padrão das variáveis
View::init([
    'URL' => URL,
    'MAIN_PATH_APP' => PATH_MAIN,
    'PATH_LOGO_PNG' => PATH_LOGO_PNG,
    'PATH_LOGO_ICO' => PATH_LOGO_ICO,
    'PATH_LOGO_PNG_IASD' => PATH_LOGO_PNG_IASD,
    'PATH_DOWNLOAD' => PATH_DOWNLOAD,
    'BIN_YT_DLP' => BIN_YT_DLP,
]);

//Define o mapeamento de middlewares

MiddlewareQueue::setMap([
    'maintenance' => \App\Http\Middleware\Maintenance::class
]);

MiddlewareQueue::setDefault([
    'maintenance'
]);
