<?php

namespace App\Utils;

class GenerateRandomKey
{
    private $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_';
    private $sequenceLength = 341;

    public function generateSequence(): string
    {
        $sequence = '';
        $charactersLength = strlen($this->characters);

        for ($i = 0; $i < $this->sequenceLength; $i++) {
            $sequence .= $this->characters[rand(0, $charactersLength - 1)];
        }

        return $sequence;
    }
}