<?php

use App\Http\Response;
use App\Controller\Application;

if (isset($obRouter)) {
    $obRouter->get('/search/download',[
        'middlewares' => [
        ],
        function($request){
            return new Response(200, Application\YbDownload::getDownloadYoutube($request));
        }
    ]);
}