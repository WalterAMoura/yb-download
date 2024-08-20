<?php

use App\Http\Response;
use App\Controller\Application;

if (isset($obRouter)) {
    $obRouter->get('/progress',[
        'middlewares' => [
        ],
        function($request){
            return new Response(200, Application\YbDownload::getProgess($request), 'application/json');
        }
    ]);
}