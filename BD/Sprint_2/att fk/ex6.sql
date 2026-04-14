CREATE DATABASE sprint2;
USE sprint2;

CREATE TABLE Farmacia (
    idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(45),
    numero INT,
    idFarmacia INT UNIQUE,
    CONSTRAINT ctfkFarmacia
        FOREIGN KEY (idFarmacia)
        REFERENCES Farmacia(idFarmacia)
);

CREATE TABLE Farmaceutico (
    idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    salario DECIMAL(10,2),
    idFarmacia INT,
    CONSTRAINT fkFarmacia
        FOREIGN KEY (idFarmacia)
        REFERENCES Farmacia(idFarmacia)
);
INSERT INTO Farmacia (nome) VALUES
('Drogaria sorriso'),
('Drogaria bombom'),
('Farmacia popular'),
('Farmacia conde'),
('Farmacia farma');

INSERT INTO Endereco (rua, numero, idFarmacia) VALUES
('bras', 198, 1),
('torraga ', 189, 2),
('novembro', 67, 3),
('maio', 13, 4),
('wall', 22, 5);

INSERT INTO Farmaceutico (nome, salario, idFarmacia) VALUES
('Marcos', 2400, 1),
('Joao', 1500, 1),
('Paulo', 3403, 2),
('Paladino', 6767, 3),
('Paula', 1431, 4);

SELECT * FROM
    Farmacia AS f
        JOIN
    Endereco AS e ON f.idFarmacia = e.idFarmacia
        JOIN
    Farmaceutico fa ON f.idFarmacia = fa.idFarmacia;
    
SELECT 
    fa.nome,
    fa.salario,
    CASE
        WHEN fa.salario >= 3500 THEN 'tá bom'
        ELSE 'tá pouco'
    END AS QualidadeSalario
FROM Farmaceutico fa;

SELECT 
    f.nome,
    IFNULL(fa.nome, 'Sem farmacêutico') AS Farmaceutico
FROM Farmacia f
LEFT JOIN Farmaceutico fa 
ON f.idFarmacia = fa.idFarmacia;


