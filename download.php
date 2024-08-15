<?php

if (isset($_GET['url']) && isset($_GET['format'])) {
    $url = 'https://www.youtube.com/watch?v=fyHRqHjy49U';
    $format = escapeshellarg($_GET['format']);
    $downloadPath = '/opt/youtube-download'; // Diretório temporário para download

    // Cria o comando para yt-dlp
    $command = "yt-dlp -f $format+bestaudio --merge-output-format mp4 -o '$downloadPath/%(title)s.%(ext)s' $url";

    // Executa o comando e captura a saída
    exec($command, $output, $return_var);

    if ($return_var === 0) {
        // Obtém o nome do arquivo baixado
        $files = glob("$downloadPath/*");
        $filePath = end($files);

        if (file_exists($filePath)) {
            // Força o download do arquivo para o usuário
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . basename($filePath) . '"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($filePath));
            readfile($filePath);

            unlink($filePath);
            exit;
        } else {
            echo "Erro: arquivo não encontrado.";
        }
    } else {
        echo "Erro ao baixar o vídeo. Código de retorno: $return_var";
    }
} else {
    echo "Parâmetros inválidos.";
}
