<?php

namespace App\Controller\Application;

use App\Http\Request;
use App\Model\Entity\Organization as EntityOrganization;
use App\Utils\Debug;
use App\Utils\General;
use App\Utils\View;
use DateTime;
use DateTimeZone;
use Exception;
use YoutubeDl\Options;
use YoutubeDl\YoutubeDl;

class YbDownload extends Page
{
    /**
     * Método responsável por retornar a mensagem de status
     * @param string $status
     * @param string|null $msgError
     * @return string|void
     */
    private static function getStatus(string $status, string $msgError = null)
    {

        // Status existe
        if(!isset($status)) return null;

        //Mensagens de status
        switch ($status){
            case 'reset-pwd':
                return Alert::getSuccess('Senha resetada com sucesso!');
                break;
            case 'created':
                return Alert::getSuccess('Registro criado com sucesso!');
                break;
            case 'updated':
                return Alert::getSuccess('Registro atualizado com sucesso!');
                break;
            case 'deleted':
                return Alert::getSuccess('Registro excluído com sucesso!');
                break;
            case 'duplicated':
                return Alert::getError('O registro ou descrição digitado já está sendo usado!');
                break;
            case 'error':
                return Alert::getError('Ocorreu um erro ao buscar video!');
                break;
            case 'rejected':
                return Alert::getWarning('O valor informado não é uma URL válida do YouTube, suportada por esta aplicação!');
                break;
        }
    }

    /**
     * Método responsável por renderizar a view da home do painel
     * @param Request $request
     * @return string
     * @throws Exception
     */
    public static function getHome(Request $request): string
    {
        // Carrega os dados da organização
        $obOrganization = new EntityOrganization();

        //Conteúdo da home
        $content = View::render('application/modules/yb-download/index', [
            'status' => null,
            'table' => null,
            'titleVideo' => null,
            'urlImgVideo' => null,
            'displayImgVideo' => 'none'
        ]);

        // Retorna a pagina completa
        return parent::getPanel($obOrganization->full_name . ' | Home', $content, 'home');
    }

    /**
     * @throws Exception
     */
    public static function getSearchVideos(Request $request)
    {
        // Carrega os dados da organização
        $obOrganization = new EntityOrganization();

        $postVars = $request->getPostVars();
        $url = $postVars['urlYoutube'];

        if(!General::isValidUrlYouTube($postVars['urlYoutube'])){
            //$request->getRouter()->redirect('/search?status=error');
            $content = View::render('application/modules/yb-download/index', [
                'status' => self::getStatus('rejected'),
                'displayImgVideo' => 'none',
                'titleVideo' => null,
                'urlImgVideo' => null,
                'table' => null
            ]);
        }else{
            $items = self::getItemsSearchVideos($request,$url);

            if($items == 'error'){
                //$request->getRouter()->redirect('/search?status=error');
                $content = View::render('application/modules/yb-download/index', [
                    'status' => self::getStatus('error'),
                    'displayImgVideo' => 'none',
                    'titleVideo' => null,
                    'urlImgVideo' => null,
                    'table' => null
                ]);
            }else{
                $table = View::render('application/modules/yb-download/search/tables/tables/youtube-download', [
                    'items' => $items['items']
                ]);
                //Debug::debug($items['urlImgVideo']);
                //Conteúdo da home
                $content = View::render('application/modules/yb-download/index', [
                    'status' => null,
                    'displayImgVideo' => 'block',
                    'titleVideo' => $items['videoTitle'],
                    'urlImgVideo' => $items['urlImgVideo'],
                    'table' => $table
                ]);
            }
        }
        // Retorna a pagina completa
        return parent::getPanel($obOrganization->full_name , $content, 'home');

    }

    /**
     * Método responsável por retornar os items da tabela
     * @param Request $request
     * @param $url
     * @return mixed
     */
    private static function getItemsSearchVideos(Request $request,$url)
    {
        $items = '';
        $videoTitle = '';
        $thumbnailUrl = '';
        $yt =  new YoutubeDl();

        $yt->setBinPath('/usr/local/bin/yt-dlp'); // Caminho para o yt-dlp
        $collection = $yt->download(
            Options::create()
                ->url($url)
                ->downloadPath('/opt/youtube-download')
                ->skipDownload(1) // Não faz o download, apenas lista os formatos
                ->format('bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4') // Listar todos os formatos
        );

        foreach ($collection->getVideos() as $video) {
            if ($video->getError() !== null) {
                //$request->getRouter()->redirect('/search?status=error');
                return 'error';
            } else {
                $videoTitle = $video->getTitle(); // Retorna o título do vídeo
                $thumbnails = $video->getThumbnails();
                //Debug::debug($thumbnails);
                $videoId = $video->getId();
                if (!empty($thumbnails)) {
                    // Inicializa a variável para armazenar a miniatura com a maior resolução
                    $bestThumbnail = null;
                    $maxResolution = 0;

                    foreach ($thumbnails as $thumbnail) {
                        // Verifica se as dimensões estão disponíveis
                        if ($thumbnail->getWidth() !== null && $thumbnail->getHeight() !== null) {
                            // Calcula a resolução (largura x altura)
                            $resolution =$thumbnail->getWidth() *  $thumbnail->getHeight();

                            // Verifica se a resolução atual é maior do que a máxima encontrada até agora
                            if ($resolution > $maxResolution) {
                                $bestThumbnail = $thumbnail;
                                $maxResolution = $resolution;
                            }
                        }
                    }

                    if ($bestThumbnail) {
                        // Exibe a miniatura com a maior resolução
                        $thumbnailUrl = $bestThumbnail->getUrl();
                    }
                }
                //print_r($video->getFormats());
                foreach ($video->getFormats() as $format) {
                    // Filtrar formatos por resolução e taxa de bits
                    //Debug::debug($format->getFormat());
                    if ($format->getResolution() && $format->getTbr() >= 1 && $format->getTbr() <= 10000 && $format->getExt() === 'mp4' && str_contains($format->getVcodec(), 'avc') && str_contains($format->getFormat(), '0p)')) {
                        //$downloadUrl = 'url=' . urlencode($url) . '&format=' . urlencode($format->getFormatId());
                        $downloadUrl = 'videoId=' . urlencode($videoId) . '&format=' . urlencode($format->getFormatId());
                        $items .= View::render('application/modules/yb-download/search/tables/items/youtube-download', [
                            'id' => htmlspecialchars($video->getFormatId()),
                            'ext' => htmlspecialchars($format->getExt()),
                            'resolution' => htmlspecialchars($format->getFormat()),
                            'codec' => $format->getVcodec(),
                            'tbr' => htmlspecialchars($format->getTbr()),
                            'downloadUrl' => $downloadUrl,
                        ]);
                    }
                }
            }
        }

        return [ 'videoTitle' => $videoTitle, 'urlImgVideo' => $thumbnailUrl,'items' => $items ];
    }

    /**
     * @param Request $request
     * @return array|void
     */
    public static function getDownloadYoutube(Request $request)
    {
        ini_set('memory_limit', '1G'); // ou '1G' para 1 GB

        $queryParams = $request->getQueryParams();
        //Debug::debug($queryParams);
        $videoId = $queryParams['videoId'];
        $urlBase = 'https://www.youtube.com/watch';
        //$url = $queryParams['url'];
        $url = $urlBase . '?v=' . $videoId;
        $format = $queryParams['format'];

        $yt = new YoutubeDl();

        $yt->setBinPath('/usr/local/bin/yt-dlp'); // Caminho para o yt-dlp

        $options = Options::create()
            ->url($url)
            ->downloadPath('/opt/youtube-download')
            ->format($format.'+bestaudio')
            ->mergeOutputFormat('mp4')
            ->output('%(title)s.%(ext)s');

        try {
            $collection = $yt->download($options);

            foreach ($collection->getVideos() as $video) {
                if ($video->getError() === null) {
                    $filePath = $video->getFile();
                    if (file_exists($filePath)) {
                        header('Content-Description: File Transfer');
                        header('Content-Type: application/octet-stream');
                        header('Content-Disposition: attachment; filename="' . basename($filePath) . '"');
                        header('Expires: 0');
                        header('Cache-Control: must-revalidate');
                        header('Pragma: public');
                        header('Content-Length: ' . filesize($filePath));
                        readfile($filePath);

                        // Remove o arquivo do servidor após o download
                        unlink($filePath);

                        exit;
                    } else {
                        //$request->getRouter()->redirect('/search?status=error');
                        return [ 'status' => 'error', 'msg' => null ];
                        //echo "Erro: arquivo não encontrado.";
                    }
                } else {
                    return [ 'status' => 'failed', 'msg' => $video->getError() ];
                    //$request->getRouter()->redirect('/search?status=error');
                    //echo "Erro ao baixar o vídeo: {$video->getError()}.";
                }
            }
        } catch (Exception $e) {
            //$request->getRouter()->redirect('/search?status=error');
            return [ 'status' => 'error', 'msg' => $e->getMessage() ];
            //echo "Erro: " . $e->getMessage();
        }
    }
}