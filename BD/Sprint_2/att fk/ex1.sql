CREATE DATABASE sprint2;
USE sprint2;

CREATE TABLE Atleta (
    idAtleta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

INSERT INTO Atleta (nome, modalidade, qtdMedalha) VALUES
('Mateus', 'Futebol', 2),
('Carlos', 'Futebol', 1),
('Ana', 'Vôlei', 3),
('Julia', 'Vôlei', 2),
('Pedro', 'Taekwondo', 4),
('Henrique', 'Taekwondo', 0);

CREATE TABLE Pais (
    idPais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    capital VARCHAR(40)
);

INSERT INTO Pais (nome, capital) VALUES
('Brasil', 'Brasilia'),
('Coreia', 'Seul'),
('Italia', 'Roma'),
('China', 'Pequim');

ALTER TABLE Atleta 
ADD COLUMN idPais INT,
ADD CONSTRAINT ctfkPais
FOREIGN KEY (idPais)
REFERENCES Pais(idPais);

UPDATE Atleta SET idPais = 3 WHERE idAtleta = 1;
UPDATE Atleta SET idPais = 4 WHERE idAtleta = 2;
UPDATE Atleta SET idPais = 1 WHERE idAtleta = 3;
UPDATE Atleta SET idPais = 2 WHERE idAtleta = 4;
UPDATE Atleta SET idPais = 3 WHERE idAtleta = 5;
UPDATE Atleta SET idPais = 4 WHERE idAtleta = 6;

SELECT *
FROM Atleta AS a
JOIN Pais AS p
ON a.idPais = p.idPais;

SELECT 
    a.nome,
    a.modalidade,
    p.nome AS Pais,
    p.capital
FROM Atleta a
JOIN Pais p
ON a.idPais = p.idPais
WHERE p.capital = 'Roma';