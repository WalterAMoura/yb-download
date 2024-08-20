<?php

// carrega autoload e outras variáveis
require __DIR__ . '/includes/app.php';

use App\Http\Router;
//Inicia nosso Router
$obRouter = new Router( URL);

// Inclui as rotas de login
include __DIR__ . '/routes/index.php';

// Imprimi o response da rota
$obRouter
    ->run()
    ->sendResponse();