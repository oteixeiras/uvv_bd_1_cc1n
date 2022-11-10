CREATE SEQUENCE empregados_id_empregado_seq;

-- Criação da tabela: empregados
CREATE TABLE empregados (
                id_empregado INTEGER NOT NULL DEFAULT nextval('empregados_id_empregado_seq'),
                email VARCHAR(35) NOT NULL,
                telefone VARCHAR(20),
                salario NUMERIC(8,2),
                comissao NUMERIC(4,2),
                nome VARCHAR(75) NOT NULL,
                id_cargo INTEGER NOT NULL,
                data_contratacao DATE NOT NULL,
                CONSTRAINT id_empregado PRIMARY KEY (id_empregado)
);

-- Informações complementares sobre a tabela e as suas colunas
COMMENT ON TABLE empregados IS 'Tabela para conter as informações dos funcionários.';
COMMENT ON COLUMN empregados.id_empregado IS 'Chave primária da tabela (gerada de forma incremental).';
COMMENT ON COLUMN empregados.email IS 'Endereço eletrônico do empregado.';
COMMENT ON COLUMN empregados.telefone IS 'Telefone de contato do empregado.';
COMMENT ON COLUMN empregados.salario IS 'Sálário mensal total recebido pelo funcionário.';
COMMENT ON COLUMN empregados.comissao IS 'Porcentagem da comissão que um empregado, caso seja da áera comercial, poderá receber dentro do mês.';
COMMENT ON COLUMN empregados.nome IS 'Nome do empregado.';
COMMENT ON COLUMN empregados.id_cargo IS 'Chave estranjeira referenciando a tabela de cargo, para indicar qual o cargo exercido pelo funcionário dentro da empresa.';
COMMENT ON COLUMN empregados.data_contratacao IS 'Data que o empregado inciou o trabalho dentro da empresa';

-- Regra para geração da primary de forma sequencial
ALTER SEQUENCE empregados_id_empregado_seq OWNED BY empregados.id_empregado;

CREATE SEQUENCE historico_cargos_id_empregado_seq;

-- Criação da tabela: historico_cargos
CREATE TABLE historico_cargos (
                id_historico_cargos INTEGER NOT NULL DEFAULT nextval('historico_cargos_id_empregado_seq'),
                id_empregado INTEGER NOT NULL,
                data_inicial   DATE NOT NULL,
                data_final DATE NOT NULL,
                CONSTRAINT data_inicial PRIMARY KEY (id_historico_cargos, id_empregado)
);

-- Informações complementares sobre a tabela e as suas colunas
COMMENT ON TABLE historico_cargos IS 'Tabela que aramazena o histórico de trabalho do funcionário dentro da empresa.';
COMMENT ON COLUMN historico_cargos.id_historico_cargos IS 'Chave primária da tabela (gerada de forma incremental).';
COMMENT ON COLUMN historico_cargos.data_inicial   IS 'Data inicial do funcionário dentro do cargo.';
COMMENT ON COLUMN historico_cargos.data_final IS 'Ultimo dia do empregado dentro do cargo (Precisa ser maior do que a data inicial)';

-- Regra para geração da primary de forma sequencial(id_historico_cargos)
ALTER SEQUENCE historico_cargos_id_empregado_seq OWNED BY historico_cargos.id_historico_cargos;

CREATE SEQUENCE cargos_id_cargo_seq;

-- Criação da tabela: cargos
CREATE TABLE cargos (
                id_cargo INTEGER NOT NULL DEFAULT nextval('cargos_id_cargo_seq'),
                cargo VARCHAR(32) NOT NULL,
                salario_minimo NUMERIC(8,2) NOT NULL,
                salario_maximo NUMERIC(8,2) NOT NULL,
                id_historico_cargos INTEGER NOT NULL,
                CONSTRAINT id_cargo PRIMARY KEY (id_cargo)
);

-- Informações complementares sobre a tabela e as suas colunas
COMMENT ON TABLE cargos IS 'Tabela para conter as informações detalhadas sobre os cargos existentes dentro da empersa.';
COMMENT ON COLUMN cargos.id_cargo IS 'Chave primária da tabela (gerada de forma incremental).';
COMMENT ON COLUMN cargos.cargo IS 'Nome do cargo.';
COMMENT ON COLUMN cargos.salario_minimo IS 'valor do salário mínimo pago dentro do cargo.';
COMMENT ON COLUMN cargos.salario_maximo IS 'valor do salário máximo pago dentro do cargo.';
COMMENT ON COLUMN cargos.id_historico_cargos IS 'Chave estrangeira da tabela historico_cargos para trazer informações sobre os trabalhadores atuais e antigos, dentro de cada cargo da empresa.';

-- Regra para geração da primary de forma sequencial(id_cargo)
ALTER SEQUENCE cargos_id_cargo_seq OWNED BY cargos.id_cargo;

CREATE SEQUENCE localizacoes_id_localizacao_seq;

-- Criação da tabela: cargos
CREATE TABLE localizacoes (
                id_localizacao INTEGER NOT NULL DEFAULT nextval('localizacoes_id_localizacao_seq'),
                endereco VARCHAR(50),
                cidade VARCHAR(50),
                uf VARCHAR(25),
                cep VARCHAR(12),
                nome_regiao VARCHAR(25) NOT NULL,
                CONSTRAINT id_localizacao PRIMARY KEY (id_localizacao)
);

-- Informações complementares sobre a tabela e as suas colunas
COMMENT ON TABLE localizacoes IS 'Tabela que contem as informações mais detalhadas sobre as localizações físicas da empresa.';
COMMENT ON COLUMN localizacoes.id_localizacao IS 'Chave primária da tabela (gerada de forma incremental).';
COMMENT ON COLUMN localizacoes.endereco IS 'cadastro do logradouro e número de identificação do imóvel.';
COMMENT ON COLUMN localizacoes.cidade IS 'Cidade da localização do imóvel.';
COMMENT ON COLUMN localizacoes.uf IS 'Abreviação do estado de localização.';
COMMENT ON COLUMN localizacoes.cep IS 'Números do código de endereçamento postal.';
COMMENT ON COLUMN localizacoes.nome_regiao IS 'Nome da região.';

-- Regra para geração da primary de forma sequencial(id_localizacao)
ALTER SEQUENCE localizacoes_id_localizacao_seq OWNED BY localizacoes.id_localizacao;

CREATE SEQUENCE departamentos_id_departamento_seq;

-- Criação da tabela: departamentos
CREATE TABLE departamentos (
                id_departamento INTEGER NOT NULL DEFAULT nextval('departamentos_id_departamento_seq'),
                nome VARCHAR(50) NOT NULL,
                id_localizacao INTEGER NOT NULL,
                id_historico_cargos INTEGER NOT NULL,
                CONSTRAINT id_departamento PRIMARY KEY (id_departamento)
);

-- Informações complementares sobre a tabela e as suas colunas
COMMENT ON TABLE departamentos IS 'Tabela para conter as informações dos departamentos.';
COMMENT ON COLUMN departamentos.id_departamento IS 'Chave primária da tabela (gerada de forma incremental).';
COMMENT ON COLUMN departamentos.nome IS 'Nome do departamento';
COMMENT ON COLUMN departamentos.id_localizacao IS 'Chave estrangeira da tabela localizacao para trazer informações sobre o endereço que possui o departamento.';
COMMENT ON COLUMN departamentos.id_historico_cargos IS 'Chave estrangeira da tabela historico_cargos, para trazer informações relacionadas ao histórico do departamento.';

-- Regra para geração da primary de forma sequencial(id_departamento)
ALTER SEQUENCE departamentos_id_departamento_seq OWNED BY departamentos.id_departamento;

CREATE SEQUENCE empregados_departamentos_id_empregados_departamentos_seq;

-- Criação da tabela: departamentos
CREATE TABLE empregados_departamentos (
                id_empregados_departamentos INTEGER NOT NULL DEFAULT nextval('empregados_departamentos_id_empregados_departamentos_seq'),
                id_empregado INTEGER NOT NULL,
                id_departamento INTEGER NOT NULL,
                CONSTRAINT empregados_departamentos_pk PRIMARY KEY (id_empregados_departamentos)
);
COMMENT ON TABLE empregados_departamentos IS 'Tabela intermédiária para conexão das tabelas empregados e departamentos, permitindo assim que um empregado possa estar em vários departamentos (caso tenha mais de um cargo), além de garantir aos departamentos terem diversos funcionários.';
COMMENT ON COLUMN empregados_departamentos.id_empregados_departamentos IS 'Chave primária da tabela (gerada de forma incremental).';
COMMENT ON COLUMN empregados_departamentos.id_empregado IS 'Chave estrangeira da tabela empregado para trazer as informações de cadastro do empregado.';
COMMENT ON COLUMN empregados_departamentos.id_departamento IS 'Chave estrangeira da tabela departamento para trazer as informações do departamento.';


-- Regra para geração da primary de forma sequencial(id_empregados_departamentos)
ALTER SEQUENCE empregados_departamentos_id_empregados_departamentos_seq OWNED BY empregados_departamentos.id_empregados_departamentos;

CREATE SEQUENCE paises_id_pais_seq;

-- Criação da tabela: departamentos
CREATE TABLE paises (
                id_pais CHAR(2) NOT NULL DEFAULT nextval('paises_id_pais_seq'),
                nome VARCHAR(50) NOT NULL,
                id_localizacao INTEGER NOT NULL,
                CONSTRAINT id_pais PRIMARY KEY (id_pais)
);

-- Informações complementares sobre a tabela e as suas colunas
COMMENT ON COLUMN paises.id_pais IS 'Chave primária da tabela (gerada de forma incremental).';
COMMENT ON COLUMN paises.nome IS 'Nome do pais cadastrado.';
COMMENT ON COLUMN paises.id_localizacao IS 'Chave estranjeira da tabela localizacoes, para referenciar dados mais detalhados sobre a localização do pais cadastrado.';

ALTER SEQUENCE paises_id_pais_seq OWNED BY paises.id_pais;

-- Adicionando referência(chave estrangeira) da tabela empregados dentro da tabela empregados_departamentos
ALTER TABLE empregados_departamentos ADD CONSTRAINT empregados_empregados_departamentos_fk
FOREIGN KEY (id_empregado)
REFERENCES empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Adicionando referência(chave estrangeira) da tabela empregados dentro da tabela historico_cargos
ALTER TABLE historico_cargos ADD CONSTRAINT empregados_historico_cargos_fk
FOREIGN KEY (id_empregado)
REFERENCES empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Adicionando referência(chave estrangeira) da tabela historico_cargos dentro da tabela cargos
ALTER TABLE cargos ADD CONSTRAINT historico_cargos_cargos_fk
FOREIGN KEY (id_historico_cargos)
REFERENCES historico_cargos (id_historico_cargos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Adicionando referência(chave estrangeira) da tabela historico_cargos dentro da tabela departamentos
ALTER TABLE departamentos ADD CONSTRAINT historico_cargos_departamentos_fk
FOREIGN KEY (id_historico_cargos)
REFERENCES historico_cargos (id_historico_cargos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Adicionando referência(chave estrangeira) da tabela historico_cargos dentro da tabela empregados
ALTER TABLE empregados ADD CONSTRAINT cargos_empregados_fk
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Adicionando referência(chave estrangeira) da tabela localizacoes dentro da tabela departamentos
ALTER TABLE departamentos ADD CONSTRAINT localizacoes_departamentos_fk
FOREIGN KEY (id_localizacao)
REFERENCES localizacoes (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Adicionando referência(chave estrangeira) da tabela localizacoes dentro da tabela paises
ALTER TABLE paises ADD CONSTRAINT localizacoes_paises_fk
FOREIGN KEY (id_localizacao)
REFERENCES localizacoes (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Adicionando referência(chave estrangeira) da tabela departamentos dentro da tabela empregados_departamentos
ALTER TABLE empregados_departamentos ADD CONSTRAINT departamentos_empregados_departamentos_fk
FOREIGN KEY (id_departamento)
REFERENCES departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
