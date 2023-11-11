create database RESERVA_DE_HOSPEDAGEM
USE RESERVA_DE_HOSPEDAGEM 

CREATE TABLE CLIENTE(
ID_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
telefone VARCHAR(11) NOT NULL,
CPF VARCHAR(11) NOT NULL,
PASSAPORTE VARCHAR(6),
sexo CHAR(1) NOT NULL,
documeto VARCHAR(7)
nome VARCHAR(30) NOT NULL,
)

CREATE TABLE nacionalidade (
ID_nacionalidade INT PRIMARY KEY NOT NULL , 
sigla VARCHAR(6),
nome VARCHAR(30)
)

CREATE TABLE CLIENTE_nacionalidade (
ID_cliente INT,
ID_nacionalidade INT,
CONSTRAINT FK_cliente_nascionalidade REFERENCES CLIENTE(ID_cliente) FOREIGN KEY (ID_cliente),
CONSTRAINT FK_nacionalidade_CLI REFERENCES NACIONALIDADE(ID_nacionalidade) FOREIGN KEY (ID_nacionalidade),
)

CREATE TABLE operadora (
ID_OPERADORA INT PRIMARY KEY NOT NULL,
COD_operadora VARCHAR(10),
NOME_operadoara VARCHAR(30)
)

CREATE TABLE TIPO_quarto (
ID_tipo_quarto INT PRIMARY KEY NOT NULL,
VAL_tipo_quarto VARCHAR(200)
DESC_tipo VARCHAR(4),
)

Create table reserva (
id_reserva int not null auto_increment primary key,
ID_cliente INT,
ID_TIPO_quarto INT,
ID_operadora INT, 
NUM_reserva VARCHAR(4) NOT NULL,
NUM_cartao VARCHAR(16),
QTD_dia INT NOT NULL,
DAT_reserva DATE NOT NULL,
DAT_inicial DATE,
STATUS1 VARCHAR(3),
CONSTRAINT FK_CLIENTE_TIPO_quarto FOREIGN KEY (ID_TIPO_quarto) REFERENCES TIPO_QUAR(ID_TIPO_quarto),
CONSTRAINT FK_CLIENTE_reserva FOREIGN KEY (ID_cliente) REFERENCES cliente(ID_cliente),
CONSTRAINT FK_CLIENTE_operadora FOREIGN KEY (ID_operadora) REFERENCES operadora(ID_operadora)
)

CREATE TABLE quarto (
ID_quarto INT NOT NULL PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
ID_TIPO_quarto INT,
ANDAR INT NOT NULL,
CONSTRAINT FK_QUARTO_tipo FOREIGN KEY (ID_TIPO_quarto) REFERENCES TIPO_quarto (ID_TIPO_quarto)
)

INSERT INTO cliente, telefone, sexo, CPF, passaporte, documento)
VALUES
    ('Cliente 1', '8198834342', 'F', '12345678901', NULL, NULL),
    ('Cliente 2', '8194657483', 'F', '98765432109', NULL, NULL),
    ('Cliente 3', '8194756423', 'F' , '81936483684', NULL, NULL),
    ('Cliente 4', '8194627453', 'F','8193645639', NULL, NULL),
  
  INSERT INTO nascionalidade (ID_nacionalidade, sigla, nome)
VALUES
    (01, 'BR', 'Brasileira'),
    (02, 'US', 'Americana'),
    (03, 'UK', 'Inglesa'),
    (04, 'JP', 'Japonesa'),
    


INSERT INTO CLIENTE_nascionalidade (ID_cliente, ID_nacionalidade)
VALUES
    (10, 01),
    (20, 02),
    (30, 03),
    (40, 04),
    

INSERT INTO operadora (ID_operadora, COD_operadora , NOME_operadora)
VALUES
    (1,'CC111', 'Operadora 1'),
    (2,'CC222', 'Operadora 2'),
    (3,'CC333', 'Operadora 3'),
    (4,'CC444', 'Operadora 4'),
    

INSERT INTO TIPO_quarto (ID_TIPO_quarto ,DESC_tipo , VAL_TIPO_quarto)
VALUES
    
    (1,'Quarto Econômico', '80.00'),
    (2,'Quarto Familiar', '150.00'),
    (3,'Quarto Standard', '100.00'),
    (4,'Suíte Luxo', '200.00'),
   
    
INSERT INTO RESERVA (ID_cliente, ID_TIPO_quarto, ID_operadora, NUM_reserva, NUM_cartao, QTD_dia, DAT_reserva, DAT_incio, STATUS1)
VALUES
    (10, 1, 1, 'RESERVA01', '1011 1213 1415 1617', 5, '20-11-2023', '22-11-2023', 'Ativa'),
    (20, 2, 2, 'RESERVA02', '1920 2122 2324 2526', 3, '22-11-2023', '24-11-2023', 'Desativada'),
    (30, 3, 3, 'RESERVA03', '2728 2930 3132 3334', 7, '25-11-2023', '28-11-2023', 'Ativa'),
    (40, 4, 4, 'RESERVA04', '3536 3738 3940 4142', 2, '27-11-2023', '30-11-2023', 'Reservada'),
  

INSERT INTO quarto (ID_TIPO_quarto, ANDAR)
VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (4, 3),
  
    

UPDATE CLIENTE SET TELEFONE = '8198834342' WHERE ID_CLIENTE = 10
DELETE FROM RESERVA WHERE id_reserva = 5

SELECT * 
FROM cliente

SELECT * 
FROM quarto

SELECT * 
FROM reserva

SELECT * 
FROM TIPO_quarto

SELECT c.nome,r.num_res, t.VAL_TIPO_quarto
from cliente c,
reserva r,
TIPO_QUAR t
where c.id_cliente = R.id_cliente
and t.ID_TIPO_quarto = r.ID_TIPO_quarto

select c.nome,r.num_reserva, t.DESC_tipo, t.VAL_TIPO_quarto
from cliente c 
inner join reserva r on c.id_cliente = R.id_cliente
inner join TIPO_quarto t on t.ID_TIPO_quarto = r.ID_TIPO_quarto