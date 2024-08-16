<?php

namespace App\Model\Entity;

class Organization
{

    /**
     * Id da organização
     * @var integer
     */
    public int $id  = 1;

    /**
     * Nome do desenvolvedor
     * @var string
     */
    public string $development = 'Walter Moura';

    /**
     * Site da organização
     * @var string
     */
    public string $site = URL;

    /**
     * Descrição da organização
     * @var string
     */
    public string $description = 'Seja bem-vindo ao painel de administração do Sistema Download YouTube';

    /**
     * Versão corrente da aplicação
     * @var string
     */
    public string $version = '1.0.0';

    /**
     * Nome reduzido, que será exibido na parte lateral da aplicação, abaixo do logo
     * @var string
     */
    public string $short_name = 'YouTube Download';

    /**
     * Nome completo, que será exibido na aplicação
     * @var string
     */
    public string $full_name = 'YouTube Download';

    /**
     * Path default de acesso à aplicação
     * @var string
     */
    public string $path_default = '/yb-download';

}