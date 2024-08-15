<?php

namespace App\Utils;

use PHPMailer\PHPMailer\Exception;
use \PHPMailer\PHPMailer\PHPMailer;

class SendEmail
{
    /**
     * Charset usado para escrita do e-mail | DEFAULT = UTF-8
     * @var string $charSet
     */
    public string $charSet = 'UTF-8';

    /**
     * Host smtp
     * @var string $host
     */
    public string $host;

    /**
     * @var string $smtpSecure
     */
    public string $smtpSecure = 'tls';

    /**
     * Porta smtp
     * @var int $port
     */
    public int $port;

    /**
     * @var bool $smtpAuth
     */
    public bool $smtpAuth;

    /**
     * @var string $username
     */
    public string $username;

    /**
     * @var string $password
     */
    public string $password;

    /**
     * @var string $from
     */
    public string $from;

    /**
     * @var string $fromName
     */
    public string $fromName;

    /**
     * @var string $addAddress
     */
    public string $addAddress;

    /**
     * @var string $addCC
     */
    public string $addCC;

    /**
     * @var int $wordWrap
     */
    public int $wordWrap = 50;

    /**
     * @var bool $isHtml
     */
    public bool $isHtml;

    /**
     * @var string $subject
     */
    public string $subject;

    /**
     * Conteúdo do e-mail a ser enviado, aceita html
     * @var string $body
     */
    public string $body;

    /**
     * @var string $altBody
     */
    public string $altBody;

    /**
     * @var string $emailSend
     */
    public string $emailSend;

    /**
     * @var string $nameSend
     */
    public string $nameSend;

    /**
     * @throws Exception
     * @return boolean
     */
    public function send(): bool
    {
        $mail = new PHPMailer();
        $mail->isSMTP();
        $mail->CharSet = $this->charSet;
        $mail->Host = $this->host;
        $mail->SMTPSecure = $this->smtpSecure;
        $mail->Port = $this->port;
        $mail->SMTPAuth = $this->smtpAuth;
        $mail->Username = $this->username;
        $mail->Password = $this->password;
        $mail->From = $this->from;
        $mail->FromName = $this->fromName;
        $mail->addAddress($this->emailSend, $this->nameSend);
        $mail->addCC($this->from, $this->fromName);
        $mail->WordWrap = $this->wordWrap;
        $mail->isHTML($this->isHtml);
        $mail->Subject = $this->subject;
        $mail->Body = $this->body;
        $mail->AltBody = $this->altBody;

        return $mail->send();
    }

}