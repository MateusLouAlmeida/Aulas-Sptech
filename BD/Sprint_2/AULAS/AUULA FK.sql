CREATE DATABASE sprint2;
USE sprint2;

CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    ra CHAR(8) UNIQUE NOT NULL,
    fk_empresa INT,
    CONSTRAINT ctFkempresa FOREIGN KEY (fk_empresa)
        REFERENCES empresa (id_empresa)
);
    
CREATE TABLE empresa (
    fk_responsavel INT UNIQUE,
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(45),
    cnpj CHAR(14) UNIQUE,
    CONSTRAINT ctFkResp FOREIGN KEY (fk_responsavel)
        REFERENCES responsavel (id_responsavel)
);
    
CREATE TABLE responsavel (
    id_responsavel INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11) UNIQUE,
    salario DECIMAL(7 , 2 )
);

INSERT INTO responsavel (nome, cpf, salario) VALUES
('Marcos Paulo', '11111111112', 5000.00),
('Jacob', '22222222221', 10000.00);

INSERT INTO empresa (razao_social, cnpj, fk_responsavel) VALUES
('Empresa da Clara', '09999999999', 2),
('Empresa de Canudos', '08888888888', 1);

INSERT INTO aluno (nome, ra, fk_empresa) VALUES
('Zeca', '12345678', 3),
('Zuca', '87654321', 4);

SELECT * FROM empresa;
SELECT 
    a.nome AS nome_aluno,
    e.razao_social AS razao,
    r.nome AS nome_responsavel
FROM
    empresa AS e
        LEFT JOIN
    aluno AS a
		ON e.id_empresa = a.fk_empresa
        RIGHT JOIN
        responsavel r 
        ON r.id_responsavel =e.fk_responsavel;