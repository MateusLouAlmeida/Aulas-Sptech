CREATE DATABASE sprint2;
USE sprint2;

CREATE TABLE Pessoa1 (
    idPessoa1 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascimento DATE
);

CREATE TABLE Pessoa2 (
    idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascimento DATE,
    fkPessoa1 INT,
    CONSTRAINT ctfkPessoa1
        FOREIGN KEY (fkPessoa1)
        REFERENCES Pessoa1(idPessoa1)
);
INSERT INTO Pessoa1 (nome, dtNascimento) VALUES
('Mateus', '2008-03-08'),
('Estevao', '2001-09-11'),
('Andre', '2004-03-15'),
('Carlos', '1998-07-30'),
('Luisa', '2002-12-05');

INSERT INTO Pessoa2 (nome, dtNascimento, fkPessoa1) VALUES
('Anna', '2008-02-02', 1),
('Bruno', '2001-03-03', 2),
('Fernando', '2002-04-04', 3),
('Rodriga', '2013-05-05', 4),
('Nicolo', '2019-06-06', 5);

SELECT *
FROM Pessoa1 p1
JOIN Pessoa2 p2
ON p1.idPessoa1 = p2.fkPessoa1;

SELECT 
    p1.nome AS Nome_Pessoa,
    p2.nome AS Nome_Filho,
    p1.dtNascimento AS Nasc_Pessoa,
    p2.dtNascimento AS Nasc_Filho
FROM Pessoa1 p1
JOIN Pessoa2 p2
ON p1.idPessoa1 = p2.fkPessoa1;

SELECT 
    p2.nome,
    CASE 
        WHEN YEAR(CURDATE()) - YEAR(p2.dtNascimento) >= 18 THEN 'Maior de idade'
        ELSE 'Menor de idade'
    END AS Maioridade
FROM Pessoa2 p2;

SELECT 
    nome,
    IFNULL(dtNascimento, '2000-01-01') AS Nascimento
FROM Pessoa2;
