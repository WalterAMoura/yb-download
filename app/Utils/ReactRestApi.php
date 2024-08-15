<?php

namespace App\Utils;

use React\Http\Browser;
use React\Promise\PromiseInterface;

class ReactRestApi
{
    private string $baseUrl;
    private array $headers = [];
    private Browser $browser;

    public function __construct(string $baseUrl, array $headers = [])
    {
        $this->baseUrl = $baseUrl;
        $this->headers = $headers;
        $this->browser = new Browser();
    }

    public function asyncRequest(string $method, string $endpoint, array $data = []): PromiseInterface
    {
        $url = rtrim($this->baseUrl, '/') . '/' . ltrim($endpoint, '/');
        $headers = $this->buildHeaders();

        $promise = $this->browser->request($method, $url, $headers, json_encode($data))->then(
            function ($response) {
                return json_decode($response->getBody(), true);
            },
            function ($error) {
                throw new \Exception($error->getMessage());
            }
        );

        return $promise;
    }

    private function buildHeaders(): array
    {
        $headers = [];
        foreach ($this->headers as $key => $value) {
            $headers[$key] = $value;
        }
        return $headers;
    }
}