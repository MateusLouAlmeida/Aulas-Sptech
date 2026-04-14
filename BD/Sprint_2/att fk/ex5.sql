CREATE DATABASE sprint2;
USE sprint2;

CREATE TABLE Pessoa (
    idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11)
);

CREATE TABLE Habilitacao (
    idHabilitacao INT PRIMARY KEY AUTO_INCREMENT,
    categoria CHAR(2),
    dataEmissao DATE,
    validade DATE,
    idPessoa INT UNIQUE,
    CONSTRAINT ctCategoria CHECK (categoria IN ('A' , 'B', 'AB')),
    CONSTRAINT ctfkPessoa FOREIGN KEY (idPessoa)
        REFERENCES Pessoa (idPessoa)
);
INSERT INTO Pessoa (nome, cpf) VALUES
('Mateus', '12345678911'),
('Estevao', '98765432100'),
('Andre', '11122233345'),
('Carlos', '44455566678'),
('Luisa', '77788899901');

INSERT INTO Habilitacao (categoria, dataEmissao, validade, idPessoa) VALUES
('A', '2025-01-01', '2026-01-01', 1),
('B', '2025-02-01', '2026-02-01', 2),
('AB', '2025-03-01', '2026-03-01', 3),
('A', '2025-04-01', '2026-04-01', 4),
('B', '2025-05-01', '2026-05-01', 5);

SELECT 
    *
FROM
    Pessoa AS p
        JOIN
    Habilitacao AS h ON p.idPessoa = h.idPessoa;

SELECT 
    p.nome,
    h.validade,
    CASE
        WHEN h.validade < CURDATE() THEN 'Vencida'
        ELSE 'Válida'
    END AS Status
FROM
    Pessoa p
        JOIN
    Habilitacao h ON p.idPessoa = h.idPessoa;
    
SELECT 
    p.nome, IFNULL(h.categoria, 'Não possui') AS Categoria
FROM
    Pessoa p
        LEFT JOIN
    Habilitacao h ON p.idPessoa = h.idPessoa