<?php
require_once __DIR__ . "/vendor/autoload.php";

use YoutubeDl\Options;
use YoutubeDl\YoutubeDl;

$yt =  new YoutubeDl();

$yt->setBinPath('/usr/local/bin/yt-dlp'); // Caminho para o yt-dlp

//$collection = $yt->download(
//    Options::create()
//        ->downloadPath('/opt/youtube-download')
//        ->url('https://www.youtube.com/watch?v=fyHRqHjy49U')
//        //->skipDownload(true) // Não faz o download, apenas lista os formatos
//        ->format('all') // Listar todos os formatos
//);
$url = 'https://www.youtube.com/watch?v=Gf9h6S5IcUw';
$collection = $yt->download(
    Options::create()
        ->url($url)
        ->downloadPath('/opt/youtube-download')
        ->skipDownload(1) // Não faz o download, apenas lista os formatos
        ->format('all') // Listar todos os formatos
);

$html = '<table border="1">';
$html .= '<tr>';
$html .= '<th>ID</th>';
$html .= '<th>Extensão</th>';
$html .= '<th>Resolução</th>';
$html .= '<th>Taxa de Bits (kbps)</th>';
$html .= '<th>Download</th>';
$html .= '</tr>';

foreach ($collection->getVideos() as $video) {
    if ($video->getError() !== null) {
        echo "Error downloading video: {$video->getError()}.";
    } else {
        echo $video->getTitle(); // Retorna o título do vídeo
        //print_r($video->getFormats());
        foreach ($video->getFormats() as $format) {
            // Filtrar formatos por resolução e taxa de bits
            if ($format->getResolution() && $format->getTbr() >= 1 && $format->getTbr() <= 5000 && $format->getExt() === 'mp4' ) {
                $downloadUrl = 'download.php?url=' . urlencode($url) . '&format=' . urlencode($format->getFormatId());
                $html .= '<tr>';
                $html .= '<td>' . htmlspecialchars($format->getFormatId()) . '</td>';
                $html .= '<td>' . htmlspecialchars($format->getExt()) . '</td>';
                $html .= '<td>' . htmlspecialchars($format->getResolution()) . '</td>';
                $html .= '<td>' . htmlspecialchars($format->getTbr()) . '</td>';
                $html .= '<td><a href="' . htmlspecialchars($downloadUrl) . '">Download</a></td>';
                $html .= '</tr>';
            }
        }
    }
}

$html .= '</table>';
echo $html;