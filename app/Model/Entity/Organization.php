<?php

namespace App\Model\Entity;

use App\Model\Database\Database;
use DateTime;
use DateTimeZone;
use Exception;
use PDOStatement;

class Organization
{
    /**
     * Tabela usada pela classe
     * @var string
     */
    private string $tabela = 'tb_organization';

    /**
     * Id da organização
     * @var integer
     */
    public int $id  = 1;

    /**
     * Nome da organização
     * @var string
     */
    public string $development;

    /**
     * Site da organização
     * @var string
     */
    public string $site;

    /**
     * Descrição da organização
     * @var string
     */
    public string $description;

    /**
     * Versão corrente da aplicação
     * @var string
     */
    public string $version;

    /**
     * Nome reduzido, que será exibido na parte lateral da aplicação, abaixo do logo
     * @var string
     */
    public string $short_name;

    /**
     * Nome completo, que será exibido na aplicação
     * @var string
     */
    public string $full_name;

    /**
     * Path default de acesso à aplicação
     * @var string
     */
    public string $path_default;

    /**
     * Data de criação
     * @var string|DateTime
     */
    public string|DateTime $created_at;

    /**
     * Data de atualização
     * @var string|DateTime
     */
    public string|DateTime $updated_at;



    /**
     * Método responsável por cadastrar a instância atual no banco de dados
     * @return boolean
     * @throws Exception
     */
    public function cadastrar()
    {
        $dtCriacao = new DateTime('now', new DateTimeZone('America/Sao_Paulo'));
        $this->created_at = $dtCriacao->setTimezone(new DateTimeZone('UTC'));
        $this->id = (new Database($this->tabela))->insert([
            'created_at' => $this->created_at->format('Y-m-d H:i:s'),
            'short_name' => $this->short_name,
            'full_name' => $this->full_name,
            'site' => $this->site,
            'description' => $this->description,
            'development' => $this->development,
            'version' => $this->version
        ]);

        // Success
        return true;
    }

    /**
     * Método responsável por atualizar os dados no banco
     * @return boolean
     * @throws Exception
     */
    public function atualizar()
    {
        $dtUpdate = new DateTime('now', new DateTimeZone('America/Sao_Paulo'));
        $this->updated_at = $dtUpdate->setTimezone(new DateTimeZone('UTC'));
        return (new Database($this->tabela))->update('id = '. $this->id,[
            'updated_at' => $this->updated_at->format('Y-m-d H:i:s'),
            'short_name' => $this->short_name,
            'full_name' => $this->full_name,
            'site' => $this->site,
            'description' => $this->description,
            'development' => $this->development,
            'version' => $this->version
        ]);
    }

    /**
     * Método responsável remover um usuário do banco de dados no banco
     * @return boolean
     */
    public function excluir()
    {
        return (new Database($this->tabela))->delete('id = '. $this->id);
    }

    /**
     * Método responsável por retornar a organization
     * @param int $id
     * @return Organization
     */
    public static function getOrganizationById(int $id)
    {
        return self::getOrganization('id = '.$id)->fetchObject(self::class);
    }

    /**
     * Método responsável por retornar os meses
     * @param string|null $where
     * @param string|null $order
     * @param string|null $limit
     * @param string|null $group
     * @param string $fields
     * @return PDOStatement
     */
    public static function getOrganization(string $where = null, string $order = null, string $limit = null, string $group = null, string $fields = '*'):PDOStatement
    {
        return (new Database('tb_organization'))->select($where,$order,$limit,$group,$fields);
    }
}