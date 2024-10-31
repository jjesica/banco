CREATE DATABASE db_BancoDados;

USE db_BancoDados;

CREATE TABLE Conta (
    con_codigo                INT PRIMARY KEY AUTO_INCREMENT,
    numero_conta              CHAR(7) NOT NULL,
    saldo                     DECIMAL(10,2) NOT NULL,
    tipo_conta                SMALLINT NOT NULL,
    age_codigo                INT,
);

CREATE TABLE Cliente (
    cli_codigo               INT PRIMARY KEY AUTO_INCREMENT,
    cpf                      CHAR(14) NOT NULL,
    nome                     VARCHAR(20) NOT NULL,
    sexo                     CHAR NOT NULL,
    endereco                 VARCHAR(45),
    email                    VARCHAR(255)
);

CREATE TABLE Banco (
    ban_codigo                INT PRIMARY KEY AUTO_INCREMENT,
    nome                      VARCHAR(30) UNIQUE
);

CREATE TABLE Agencia (
    age_codigo                INT PRIMARY KEY AUTO_INCREMENT,
    numero_agencia            VARCHAR(45) NOT NULL,
    endereco                  VARCHAR(45) NOT NULL,
    ban_codigo                INT,
);

CREATE TABLE Historico (
    his_codigo               INT PRIMARY KEY AUTO_INCREMENT,
    cli_codigo               INT,
    con_codigo               INT,
    data_inicio              DATE NOT NULL,
);

CREATE TABLE TelefoneCliente (
    tel_codigo               INT PRIMARY KEY AUTO_INCREMENT,
    cli_codigo               INT,
    telefone_cli             CHAR(13) NOT NULL,
);

CONSTRAINT fk_ban_codigo 
    FOREIGN KEY (ban_codigo) 
    REFERENCES Banco (ban_codigo) ON DELETE CASCADE ON UPDATE CASCADE    

CONSTRAINT fk_age_codigo 
    FOREIGN KEY (age_codigo) 
    REFERENCES Agencia (age_codigo) ON DELETE CASCADE ON UPDATE CASCADE    

CONSTRAINT fk_cli_codigo 
    FOREIGN KEY (cli_codigo) 
    REFERENCES Cliente (cli_codigo) ON DELETE CASCADE ON UPDATE CASCADE    

CONSTRAINT fk_con_codigo 
    FOREIGN KEY (con_codigo) 
    REFERENCES Conta (con_codigo) ON DELETE CASCADE ON UPDATE CASCADE    

CONSTRAINT fk_cli_codigo_telefone 
    FOREIGN KEY (cli_codigo) 
    REFERENCES Cliente (cli_codigo) ON DELETE CASCADE ON UPDATE CASCADE    

INSERT INTO Banco (nome) VALUES ('Banco do Brasil'), ('CEF');

INSERT INTO Agencia (numero_agencia, endereco, ban_codigo) 
VALUES ('0562', 'Rua Teixeira Alves, 1595', 2), 
       ('3153', 'Av. Pires, 1969', 1);

INSERT INTO Cliente (cpf, nome, sexo, endereco, email)
VALUES ('111.222.333-44', 'Jennifer B Souza', 'F', 'Rua Cuiabá, 1050', NULL),
       ('666.777.888-99', 'Caetano K Lima', 'M', 'Rua Ivinhema, 879', 'caetanolima@gmail.com'),
       ('555.444.777-33', 'Silvia Macedo', 'F', 'Rua Estados Unidos, 735', NULL);

INSERT INTO Conta (numero_conta, saldo, tipo_conta, age_codigo)
VALUES ('86340-2', 763.05, 2, 2), 
       ('23584-7', 3879.12, 1, 1);

INSERT INTO Historico (cli_codigo, con_codigo, data_inicio)
VALUES (1, 2, '1997-12-17'),
       (2, 2, '1997-12-17'),
       (3, 1, '2010-11-29');

INSERT INTO TelefoneCliente (cli_codigo, telefone_cli)
VALUES (1, '(67)3422-7788'), 
       (2, '(67)3423-9900'), 
       (2, '(67)8121-8833');

UPDATE Cliente SET email = 'caetanolima@gmail.com' WHERE nome = 'Caetano K Lima';

DELETE FROM Conta WHERE numero_conta = '86340-2';

UPDATE Conta SET saldo = saldo * 1.1 WHERE numero_conta = '23584-7';

