/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Sebastião Oliveira Silva Neto - 2011478
DATA: 14/03/2023 
*/

CREATE DATABASE astronomia;

USE astronomia;

/*criação de uma tabela de galaxias*/
CREATE TABLE Galaxias (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    tipo VARCHAR(255),
    distancia REAL,
    massa REAL,
    idade REAL
);

/*criação de uma tabela de estrelas*/
CREATE TABLE Estrelas (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    tipo VARCHAR(255),
    temperatura INT,
    magnitude REAL,
    idade REAL,
    id_galaxia INT,
    FOREIGN KEY (id_galaxia) REFERENCES Galaxias(id)
);

/*criação de uma tabela de planetas*/
CREATE TABLE Planetas (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    tipo VARCHAR(255),
    distancia_estrela REAL,
    periodo_orbital REAL,
    id_estrela INT,
    FOREIGN KEY (id_estrela) REFERENCES Estrelas(id)
);

/*criação de uma tabela de cometas*/
CREATE TABLE Cometas (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    periodo_orbital REAL,
    data_descoberta DATE
);

/*criação de uma tabela de astronomos*/
CREATE TABLE Astronomos (
    id INT PRIMARY KEY,
    nome VARCHAR(45),
    sobrenome VARCHAR(45),
    pais VARCHAR(45),
    data_nascimento DATE,
    especialidade VARCHAR(255)
);

/*Essas são restrições adicionadas às tabelas do banco de dados para garantir a integridade dos dados e evitar inconsistências.*/
ALTER TABLE Galaxias ADD CONSTRAINT CHK_DISTANCIA_POSITIVA CHECK (distancia > 0);
ALTER TABLE Estrelas ADD CONSTRAINT FK_ESTRELA_GALAXIA FOREIGN KEY (id_galaxia) REFERENCES Galaxias(id);
ALTER TABLE Planetas ADD CONSTRAINT FK_PLANETA_ESTRELA FOREIGN KEY (id_estrela) REFERENCES Estrelas(id);
ALTER TABLE Cometas ADD CONSTRAINT CHK_PERIOD_ORBITAL_POSITIVO CHECK (periodo_orbital > 0);

/*Alterando o nome de uma coluna na tabela Galaxias*/
ALTER TABLE Galaxias
CHANGE COLUMN tipo tipo_galaxia VARCHAR(255);

/*Adicionando uma nova coluna na tabela Estrelas*/
ALTER TABLE Estrelas
ADD COLUMN luminosidade REAL;

/*Excluindo a tabela Cometas*/
DROP TABLE Cometas;

/*Removendo uma coluna da tabela Planetas*/
ALTER TABLE Planetas
DROP COLUMN periodo_orbital;
