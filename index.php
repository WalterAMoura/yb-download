<?php

// carrega autoload e outras variáveis
require __DIR__ . '/includes/app.php';

use App\Http\Router;
//Inicia nosso Router
$obRouter = new Router( URL);

// Inclui as rotas de login
include __DIR__ . '/routes/index.php';
// Inclui as rotas da aplicação
include __DIR__ . '/routes/application.php';
// Inclui as rotas de session
include __DIR__ . '/routes/session.php';
// Inclui as rotas do admin
include __DIR__ . '/routes/api.php';
// inclui as rotas de e-mail
include __DIR__ . '/routes/email.php';

// Imprimi o response da rota
$obRouter
    ->run()
    ->sendResponse();