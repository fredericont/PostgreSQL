CREATE TABLE pessoas (
    cpf                                VARCHAR(11) PRIMARY KEY,
    nome                               VARCHAR(50) NOT NULL,
    rg                                 VARCHAR(14) NOT NULL,
    cnh                                VARCHAR(11) NOT NULL,
    tipo_cnh                           VARCHAR(4) NOT NULL,
    logradouro                         VARCHAR(50) NOT NULL,
    cep                                VARCHAR(8) NOT NULL,
    complemento                        VARCHAR(30),
    numero                             SMALLINT,
    bairro                             VARCHAR(20) NOT NULL,
    cidade                             VARCHAR(20) NOT NULL,
    estado                             VARCHAR(20) NOT NULL,
    celular                            VARCHAR(11) NOT NULL,
    residencial                        VARCHAR(11),
    comercial                          VARCHAR(11),
    data_cadastro                      DATE NOT NULL
);

CREATE TABLE veiculos (
    chassi                              VARCHAR(17) PRIMARY KEY,
    placa                               VARCHAR(7) NOT NULL,
    ano_modelo                          YEAR NOT NULL,
    ano_fabricacao                      YEAR ,
    motor                               VARCHAR(3) NOT NULL,
    km_atual                            VARCHAR(8) NOT NULL,
    valor_diaria                        DECIMAL NOT NULL,
    id_modelo                           INTEGER NOT NULL,
    id_combustivel                      INTEGER NOT NULL,
    id_cor                              INTEGER NOT NULL
);

CREATE TABLE locacao (
    num_contrato                        SERIAL PRIMARY KEY,
    data_locacao                        TIMESTAMP NOT NULL,
    data_prevista_devolucao             DATE NOT NULL,
    data_efetiva_devolucao              TIMESTAMP, 
    km_inicial                          INTEGER NOT NULL,
    km_final                            INTEGER NOT NULL,
    cpf                                 VARCHAR(11),
    chassi                              INTEGER
);

CREATE TABLE funcionarios (
    id_funcionario                      SERIAL PRIMARY KEY,
    salario                             DECIMAL,
    data_contratacao                    DATE NOT NULL,
    cpf                                 VARCHAR(11)
);

CREATE TABLE marcas (
    id_marca                            SERIAL PRIMARY KEY,
    nome_marca                          VARCHAR(25) NOT NULL
);

CREATE TABLE modelos (
    id_modelo                           SERIAL PRIMARY KEY,
    nome_modelo                         VARCHAR(25),
    id_marca                            INTEGER
);

CREATE TABLE combustiveis (
    id_combustivel                      SERIAL PRIMARY KEY,
    nome_combustivel                    VARCHAR(15) NOT NULL
    
);

CREATE TABLE cores (
    id_cor                              SERIAL PRIMARY KEY,
    nome_cor                            VARCHAR(25)
);


-- DEFININDO CONSTRAINTS FK --

ALTER TABLE veiculos ADD CONSTRAINT FK_veiculos_1
    FOREIGN KEY                         (id_modelo)
    REFERENCES modelos                  (id_modelo)
    ON DELETE RESTRICT;
 
ALTER TABLE veiculos ADD CONSTRAINT FK_veiculos_2
    FOREIGN KEY                         (id_combustivel)
    REFERENCES combustiveis             (id_combustivel)
    ON DELETE RESTRICT;
 
ALTER TABLE veiculos ADD CONSTRAINT FK_veiculos_3
    FOREIGN KEY                         (id_cor)
    REFERENCES cores                    (id_cor)
    ON DELETE RESTRICT;
 
ALTER TABLE locacao ADD CONSTRAINT FK_locacao_1
    FOREIGN KEY                         (cpf)
    REFERENCES pessoas                  (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE locacao ADD CONSTRAINT FK_locacao_2
    FOREIGN KEY                         (chassi)
    REFERENCES veiculos                 (chassi)
    ON DELETE RESTRICT;
 
ALTER TABLE funcionarios ADD CONSTRAINT FK_funcionarios_1
    FOREIGN KEY                         (cpf)
    REFERENCES pessoas                  (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE modelos ADD CONSTRAINT FK_modelos_1
    FOREIGN KEY                         (id_marca)
    REFERENCES marcas                   (id_marca)
    ON DELETE RESTRICT;


-- CHECKS --

ALTER TABLE pessoas ADD CONSTRAINT CK_cpf CHECK (LENGTH(cpf) = 11)
ALTER TABLE pessoas ADD CONSTRAINT CK_cnh CHECK (LENGTH(cnh) = 11)
ALTER TABLE pessoas ADD CONSTRAINT CK_celular CHECK (LENGTH(celular) = 11)
ALTER TABLE pessoas ADD CONSTRAINT CK_data_cadastro CHECK (data_cadastro = CURRENT_DATE)

ALTER TABLE veiculos ADD CONSTRAINT CK_placa CHECK (LENGTH(placa) = 7)

ALTER TABLE locacao ADD CONSTRAINT CK_kilometragem CHECK (km_final > km_inicial)
ALTER TABLE locacao ADD CONSTRAINT CK_data_locacao CHECK (data_prevista_devolucao > data_locacao)
ALTER TABLE locacao ADD CONSTRAINT CK_data_locacao CHECK (data_efetiva_devolucao >= data_locacao)
