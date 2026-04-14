CREATE DATABASE sprint2;

USE sprint2;

CREATE TABLE pessoa(
    idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11)
);

CREATE TABLE reserva(
    idReserva INT PRIMARY KEY AUTO_INCREMENT,
    dtReserva DATETIME,
    dtRetirada DATETIME,
    dtDevolucao DATETIME,
	idPessoa INT,
    CONSTRAINT fkPessoa 
		FOREIGN KEY (idPessoa)
        REFERENCES pessoa (idPessoa)
);

INSERT INTO pessoa (nome, cpf) VALUES
('mateus', '12345678911'),
('estevao', '98765432100'),
('andre', '11122233345'),
('carlos', '44455566678'),
('luisa', '77788899901');

INSERT INTO reserva (dtReserva, dtRetirada, dtDevolucao, idPessoa) VALUES
('2008-03-08 01:12:03', '2008-05-08 13:22:17', '2008-07-08', 1),
('2001-11-09 02:55:12', '2001-12-25 07:24:24', '2002-02-15', 2),
('2004-02-15 22:22:22', '2004-04-15 08:21:32', '2004-06-23', 3),
('2000-10-09 00:00:01', '2000-11-29 12:43:54', '2000-12-01', 4),
('2026-01-01 09:21:32', '2026-02-02 09:55:12', '2026-03-03', 5);
SELECT * FROM reserva JOIN pessoa;
select * from pessoa;
SELECT 
    p.nome Nome,
    r.dtReserva Reserva,
    r.dtRetirada Retirada,
	IFNULL(r.dtDevolucao, 'Não devolvido') AS Devolucao,
    CASE
        WHEN r.dtDevolucao < NOW() THEN 'Finalizou'
        ELSE 'Em andamento'
    END AS stsReserva
FROM
    pessoa AS p
        JOIN
    reserva AS r 
    ON p.idPessoa = r.idPessoa;


drop table pessoa;
truncate table reserva;