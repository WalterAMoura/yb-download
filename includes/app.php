<?php
require __DIR__ . '/../vendor/autoload.php';


use App\Utils\View;
use App\Utils\Environment;
//use App\Model\Database\Database;
use App\Http\Middleware\Queue as MiddlewareQueue;

//Carrega variáveis de ambiente
Environment::load(__DIR__ . '/../../config/env/yb-download/');

// Define as configurações de banco de dados
//Database::config(
//    getenv('DB_HOST'),
//    getenv('DB_NAME'),
//    getenv('DB_USER'),
//    getenv('DB_PASS'),
//    getenv('DB_PORT')
//);

// Dados encryption
const OPTIONS_BCRYPT = [
    'cost' => 12
];

// Define o tempo de expiração da sessão do usuário
define("SESSION_EXPIRATION", intval(getenv('SESSION_EXPIRATION')));
//define("SESSION_EXPIRATION", 12);
// Define session name
define("SESSION_NAME", getenv('SESSION_NAME'));

// Define a constante de URL do projeto
define("URL", getenv('URL'));
define("PATH_MAIN", getenv('PATH_MAIN'));
define("PATH_LOGO_PNG", getenv('PATH_LOGO_PNG'));
define("PATH_LOGO_ICO", getenv('PATH_LOGO_ICO'));
define("PATH_LOGO_PNG_IASD", getenv('PATH_LOGO_PNG_IASD'));

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
