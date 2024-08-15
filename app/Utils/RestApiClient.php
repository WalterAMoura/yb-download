<?php

namespace App\Utils;

use Exception;

class RestApiClient {
    private $baseUrl;
    private $headers = [];

    private $queryParams;

    /**
     * @param $baseUrl
     */
    public function __construct($baseUrl) {
        $this->baseUrl = $baseUrl;
    }

    /**
     * @param $headers
     * @return void
     */
    public function setHeaders($headers) {
        $this->headers = $headers;
    }

    /**
     * @param $queryParams
     * @return void
     */
    public function setQueryParams($queryParams)
    {
        $this->queryParams = http_build_query($queryParams);
    }

    /**
     * @throws Exception
     */
    public function request($method, $endpoint, $data = null) {
        $url = (!is_string($this->queryParams) || empty($this->queryParams))?rtrim($this->baseUrl, '/') . '/' . ltrim($endpoint, '/'): rtrim($this->baseUrl, '/') . '/' . ltrim($endpoint, '/') . '?' . $this->queryParams;

        $options = [
            'http' => [
                'method' => $method,
                'header' => $this->buildHeaders(),
                'ignore_errors' => true,
            ],
        ];

        if ($data !== null) {
            $options['http']['content'] = json_encode($data);
        }

        $context = stream_context_create($options);
        $response = file_get_contents($url, false, $context);

        if ($response === false) {
            throw new Exception("Erro na requisição: " . error_get_last()['message']);
        }

        return json_decode($response);
    }

    private function buildHeaders() {
        $headerLines = [];
        foreach ($this->headers as $key => $value) {
            $headerLines[] = "$key: $value";
        }
        return implode("\r\n", $headerLines);
    }
}
