-- Criação da tabela: empregados
CREATE TABLE empregados (
                id_empregado INT AUTO_INCREMENT NOT NULL,
                email VARCHAR(35) NOT NULL,
                telefone VARCHAR(20),
                salario DECIMAL(8,2),
                comissao DECIMAL(4,2),
                nome VARCHAR(75) NOT NULL,
                id_cargo INT NOT NULL,
                data_contratacao DATE NOT NULL,
                PRIMARY KEY (id_empregado)
);

-- Informações complementares sobre a tabela e as suas colunas
ALTER TABLE empregados COMMENT 'Tabela para conter as informações dos funcionários.';

ALTER TABLE empregados MODIFY COLUMN id_empregado INTEGER COMMENT 'Chave primária da tabela (gerada de forma incremental).';

ALTER TABLE empregados MODIFY COLUMN email VARCHAR(35) COMMENT 'Endereço eletrônico do empregado.';

ALTER TABLE empregados MODIFY COLUMN telefone VARCHAR(20) COMMENT 'Telefone de contato do empregado.';

ALTER TABLE empregados MODIFY COLUMN salario DECIMAL(8, 2) COMMENT 'Sálário mensal total recebido pelo funcionário.';

ALTER TABLE empregados MODIFY COLUMN comissao DECIMAL(4, 2) COMMENT 'Porcentagem da comissão que um empregado, caso seja da áera comercial, poderá receber dentro do mês.';

ALTER TABLE empregados MODIFY COLUMN nome VARCHAR(75) COMMENT 'Nome do empregado.';

ALTER TABLE empregados MODIFY COLUMN id_cargo INTEGER COMMENT 'Chave estranjeira referenciando a tabela de cargo, para indicar qual o cargo exercido pelo funcionário dentro da empresa.';

ALTER TABLE empregados MODIFY COLUMN data_contratacao DATE COMMENT 'Data que o empregado inciou o trabalho dentro da empresa';

-- Criação da tabela: historico_cargos
CREATE TABLE historico_cargos (
                id_historico_cargos INT AUTO_INCREMENT NOT NULL,
                id_empregado INT NOT NULL,
                data_inicial   DATE NOT NULL,
                data_final DATE NOT NULL,
                PRIMARY KEY (id_historico_cargos, id_empregado)
);

-- Informações complementares sobre a tabela e as suas colunas
ALTER TABLE historico_cargos COMMENT 'Tabela que aramazena o histórico de trabalho do funcionário dentro da empresa.';

ALTER TABLE historico_cargos MODIFY COLUMN id_historico_cargos INTEGER COMMENT 'Chave primária da tabela (gerada de forma incremental).';

ALTER TABLE historico_cargos MODIFY COLUMN data_inicial   DATE COMMENT 'Data inicial do funcionário dentro do cargo.';

ALTER TABLE historico_cargos MODIFY COLUMN data_final DATE COMMENT 'Ultimo dia do empregado dentro do cargo (Precisa ser maior do que a data inicial)';


CREATE TABLE cargos (
                id_cargo INT AUTO_INCREMENT NOT NULL,
                cargo VARCHAR(32) NOT NULL,
                salario_minimo DECIMAL(8,2) NOT NULL,
                salario_maximo DECIMAL(8,2) NOT NULL,
                id_historico_cargos INT NOT NULL,
                PRIMARY KEY (id_cargo)
);

-- Informações complementares sobre a tabela e as suas colunas
ALTER TABLE cargos COMMENT 'Tabela para conter as informações detalhadas sobre os cargos existentes dentro da empersa.';

ALTER TABLE cargos MODIFY COLUMN id_cargo INTEGER COMMENT 'Chave primária da tabela (gerada de forma incremental).';

ALTER TABLE cargos MODIFY COLUMN cargo VARCHAR(32) COMMENT 'Nome do cargo.';

ALTER TABLE cargos MODIFY COLUMN salario_minimo DECIMAL(8, 2) COMMENT 'valor do salário mínimo pago dentro do cargo.';

ALTER TABLE cargos MODIFY COLUMN salario_maximo DECIMAL(8, 2) COMMENT 'valor do salário máximo pago dentro do cargo.';

ALTER TABLE cargos MODIFY COLUMN id_historico_cargos INTEGER COMMENT 'Chave estrangeira da tabela historico_cargos para trazer informações sobre os trabalhadores atuais e antigos, dentro de cada cargo da empresa.';


CREATE TABLE localizacoes (
                id_localizacao INT AUTO_INCREMENT NOT NULL,
                endereco VARCHAR(50),
                cidade VARCHAR(50),
                uf VARCHAR(25),
                cep VARCHAR(12),
                nome_regiao VARCHAR(25) NOT NULL,
                PRIMARY KEY (id_localizacao)
);

-- Informações complementares sobre a tabela e as suas colunas
ALTER TABLE localizacoes COMMENT 'Tabela que contem as informações mais detalhadas sobre as localizações físicas da empresa.';

ALTER TABLE localizacoes MODIFY COLUMN id_localizacao INTEGER COMMENT 'Chave primária da tabela (gerada de forma incremental).';

ALTER TABLE localizacoes MODIFY COLUMN endereco VARCHAR(50) COMMENT 'cadastro do logradouro e número de identificação do imóvel.';

ALTER TABLE localizacoes MODIFY COLUMN cidade VARCHAR(50) COMMENT 'Cidade da localização do imóvel.';

ALTER TABLE localizacoes MODIFY COLUMN uf VARCHAR(25) COMMENT 'Abreviação do estado de localização.';

ALTER TABLE localizacoes MODIFY COLUMN cep VARCHAR(12) COMMENT 'Números do código de endereçamento postal.';

ALTER TABLE localizacoes MODIFY COLUMN nome_regiao VARCHAR(25) COMMENT 'Nome da região.';


CREATE TABLE departamentos (
                id_departamento INT AUTO_INCREMENT NOT NULL,
                nome VARCHAR(50) NOT NULL,
                id_localizacao INT NOT NULL,
                id_historico_cargos INT NOT NULL,
                PRIMARY KEY (id_departamento)
);

-- Informações complementares sobre a tabela e as suas colunas
ALTER TABLE departamentos COMMENT 'Tabela para conter as informações dos departamentos.';

ALTER TABLE departamentos MODIFY COLUMN id_departamento INTEGER COMMENT 'Chave primária da tabela (gerada de forma incremental).';

ALTER TABLE departamentos MODIFY COLUMN nome VARCHAR(50) COMMENT 'Nome do departamento';

ALTER TABLE departamentos MODIFY COLUMN id_localizacao INTEGER COMMENT 'Chave estrangeira da tabela localizacao para trazer informações sobre o endereço que possui o departamento.';

ALTER TABLE departamentos MODIFY COLUMN id_historico_cargos INTEGER COMMENT 'Chave estrangeira da tabela historico_cargos, para trazer informações relacionadas ao histórico do departamento.';


CREATE TABLE empregados_departamentos (
                id_empregados_departamentos INT AUTO_INCREMENT NOT NULL,
                id_empregado INT NOT NULL,
                id_departamento INT NOT NULL,
                PRIMARY KEY (id_empregados_departamentos)
);

-- Informações complementares sobre a tabela e as suas colunas
ALTER TABLE empregados_departamentos COMMENT 'Tabela intermédiária para conexão das tabelas empregados e departamentos, permitindo assim que um empregado possa estar em vários departamentos (caso tenha mais de um cargo), além de garantir aos departamentos terem diversos funcionários.';

ALTER TABLE empregados_departamentos MODIFY COLUMN id_empregados_departamentos INTEGER COMMENT 'Chave primária da tabela (gerada de forma incremental).';

ALTER TABLE empregados_departamentos MODIFY COLUMN id_empregado INTEGER COMMENT 'Chave estrangeira da tabela empregado para trazer as informações de cadastro do empregado.';

ALTER TABLE empregados_departamentos MODIFY COLUMN id_departamento INTEGER COMMENT 'Chave estrangeira da tabela departamento para trazer as informações do departamento.';


CREATE TABLE paises (
                id_pais CHAR(2) AUTO_INCREMENT NOT NULL,
                nome VARCHAR(50) NOT NULL,
                id_localizacao INT NOT NULL,
                PRIMARY KEY (id_pais)
);

-- Informações complementares sobre a tabela e as suas colunas
ALTER TABLE paises MODIFY COLUMN id_pais CHAR(2) COMMENT 'Chave primária da tabela (gerada de forma incremental).';

ALTER TABLE paises MODIFY COLUMN nome VARCHAR(50) COMMENT 'Nome do pais cadastrado.';

ALTER TABLE paises MODIFY COLUMN id_localizacao INTEGER COMMENT 'Chave estranjeira da tabela localizacoes, para referenciar dados mais detalhados sobre a localização do pais cadastrado.';

-- Adicionando referência(chave estrangeira) da tabela empregados dentro da tabela empregados_departamentos
ALTER TABLE empregados_departamentos ADD CONSTRAINT empregados_empregados_departamentos_fk
FOREIGN KEY (id_empregado)
REFERENCES empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Adicionando referência(chave estrangeira) da tabela empregados dentro da tabela historico_cargos
ALTER TABLE historico_cargos ADD CONSTRAINT empregados_historico_cargos_fk
FOREIGN KEY (id_empregado)
REFERENCES empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Adicionando referência(chave estrangeira) da tabela historico_cargos dentro da tabela cargos
ALTER TABLE cargos ADD CONSTRAINT historico_cargos_cargos_fk
FOREIGN KEY (id_historico_cargos)
REFERENCES historico_cargos (id_historico_cargos)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Adicionando referência(chave estrangeira) da tabela historico_cargos dentro da tabela departamentos
ALTER TABLE departamentos ADD CONSTRAINT historico_cargos_departamentos_fk
FOREIGN KEY (id_historico_cargos)
REFERENCES historico_cargos (id_historico_cargos)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Adicionando referência(chave estrangeira) da tabela historico_cargos dentro da tabela empregados
ALTER TABLE empregados ADD CONSTRAINT cargos_empregados_fk
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Adicionando referência(chave estrangeira) da tabela localizacoes dentro da tabela departamentos
ALTER TABLE departamentos ADD CONSTRAINT localizacoes_departamentos_fk
FOREIGN KEY (id_localizacao)
REFERENCES localizacoes (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Adicionando referência(chave estrangeira) da tabela localizacoes dentro da tabela paises
ALTER TABLE paises ADD CONSTRAINT localizacoes_paises_fk
FOREIGN KEY (id_localizacao)
REFERENCES localizacoes (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Adicionando referência(chave estrangeira) da tabela departamentos dentro da tabela empregados_departamentos
ALTER TABLE empregados_departamentos ADD CONSTRAINT departamentos_empregados_departamentos_fk
FOREIGN KEY (id_departamento)
REFERENCES departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
