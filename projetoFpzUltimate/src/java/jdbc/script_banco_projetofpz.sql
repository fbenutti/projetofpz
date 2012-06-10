 DROP DATABASE IF EXISTS projetofpz;

 CREATE DATABASE IF NOT EXISTS projetofpz;

USE projetofpz;

CREATE TABLE login (
    user_name varchar(50) not null,
    senha varchar(50) not null,
    tipo varchar(1) not null,
    PRIMARY KEY (user_name) 
)ENGINE=InnoDB;

CREATE TABLE instituicao(
    cnpj varchar(20) not null,
    nome varchar(100) not null,
    email varchar(100),
    cep varchar(10),
    bairro varchar(100),
    cidade varchar(100),
    uf char(2),
    complemento varchar(40),
    numero int(10),
    rua varchar(40),
    telefone varchar(20),
    es_user_name varchar(50),
    PRIMARY KEY (cnpj),
    CONSTRAINT FOREIGN KEY (es_user_name) REFERENCES login (user_name)
)ENGINE=InnoDB;

CREATE TABLE pessoa(
    cpf varchar(18) not null,
    nome varchar(100) not null,
    email varchar(100),
    cep varchar(10),
    bairro varchar(100),
    cidade varchar(100),
    uf char(2),
    complemento varchar(40),
    numero int(10),
    rua varchar(40),
    telefone varchar(20),
    es_user_name varchar(50),
    PRIMARY KEY (cpf),
    CONSTRAINT FOREIGN KEY (es_user_name) REFERENCES login (user_name)
)ENGINE=InnoDB;

CREATE TABLE pessoa_instituicao(
    id_pessoa_instituicao int (10) not null auto_increment,
    es_cpf varchar(18) not null,
    es_cnpj varchar(20) not null,
    PRIMARY KEY (id_pessoa_instituicao),
    CONSTRAINT FOREIGN KEY (es_cpf) REFERENCES pessoa (cpf),
    CONSTRAINT FOREIGN KEY (es_cnpj) REFERENCES instituicao (cnpj)
)ENGINE=InnoDB;

CREATE TABLE evento(
    id_evento int(10) not null auto_increment,
    dt_inicio varchar(15),
    dt_fim varchar(15),
    PRIMARY KEY (id_evento)
)ENGINE=InnoDB;

CREATE TABLE inscricao(
    id_inscricao int(10) not null auto_increment,
    es_cpf varchar(18) not null,
    es_evento int(10) not null,
    PRIMARY KEY (id_inscricao),
    CONSTRAINT FOREIGN KEY (es_cpf) REFERENCES pessoa (cpf),
    CONSTRAINT FOREIGN KEY (es_evento) REFERENCES evento (id_evento)
)ENGINE=InnoDB;

CREATE TABLE responsavel(
    id_responsavel int(10) not null auto_increment,
    nome varchar(100) not null,
    email varchar(100),
    cidade varchar(50),
    uf char(2),
    PRIMARY KEY (id_responsavel)
)ENGINE=InnoDB;

CREATE TABLE fotos(
    id_foto int(10) not null auto_increment,
    foto longblob,
    es_responsavel int(10) not null,
    PRIMARY KEY (id_foto),
    CONSTRAINT FOREIGN KEY (es_responsavel) REFERENCES responsavel (id_responsavel)
)ENGINE=InnoDB;

CREATE TABLE atividade(
    id_atividade int(10) not null auto_increment,
    descricao varchar(400) not null,
    vagas int(6),
    horario_inicio varchar(15),
    horario_fim varchar(15),
    es_evento int(10) not null,
    es_responsavel int(10) not null,
    PRIMARY KEY (id_atividade), 
    CONSTRAINT FOREIGN KEY (es_evento) REFERENCES evento (id_evento),
    CONSTRAINT FOREIGN KEY (es_responsavel) REFERENCES responsavel (id_responsavel)
)ENGINE=InnoDB;
