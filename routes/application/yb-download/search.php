<?php

use App\Http\Response;
use App\Controller\Application;

if (isset($obRouter)) {
    $obRouter->get('/search',[
        'middlewares' => [
        ],
        function($request){
            return new Response(200, Application\YbDownload::getHome($request));
        }
    ]);

    $obRouter->post('/search',[
        'middlewares' => [
        ],
        function($request){
            return new Response(200, Application\YbDownload::getSearchVideos($request));
        }
    ]);
}