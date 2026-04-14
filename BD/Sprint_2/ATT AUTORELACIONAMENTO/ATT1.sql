CREATE DATABASE sprint2;
USE sprint2;

CREATE TABLE areas(
id_areas INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45)
);

CREATE TABLE funcionario (
id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fk_supervisor INT,
fk_areas INT,
CONSTRAINT ctfk_supervisor
FOREIGN KEY (fk_supervisor)
REFERENCES funcionario(id_funcionario),

CONSTRAINT ctfk_areas
FOREIGN KEY (fk_areas)
REFERENCES areas(id_areas)
);

INSERT INTO areas (nome) VALUES
('marketin'),
('administracao'),
('gestao de ti'),
('DEVOPS');

INSERT INTO funcionario(nome, fk_areas) VALUES
('Mateus', 4),
('André', 2);

INSERT INTO funcionario(nome, fk_supervisor, fk_areas) VALUES
('Jhonatan', 1, 3),
('Celia', 2, 1),
('Ana', 2, 2);

UPDATE funcionario
SET fk_supervisor = 1
WHERE id_funcionario = 2;

SELECT 
f.nome funcionario,
f.fk_supervisor supervisor,
f.fk_areas areas,
a.nome setor
FROM 
funcionario AS f
JOIN areas AS a
ON (f.fk_areas) = (a.id_areas)
ORDER BY f.id_funcionario;

SELECT 
f.nome funcionario,
f.fk_supervisor supervisor,
f.fk_areas areas,
a.nome setor,
CASE 
	WHEN a.nome = 'gestao de ti' THEN 'TI'
    WHEN a.nome = 'administracao' THEN 'patrao' 
    ELSE 'peao'
    END AS apelido
FROM 
funcionario AS f
JOIN areas AS a
ON (f.fk_areas) = (a.id_areas);

SELECT 
f.nome funcionario,
f.fk_supervisor supervisor,
f.fk_areas areas,
a.nome setor
FROM 
funcionario AS f
JOIN areas AS a
ON (f.fk_areas) = (a.id_areas)
WHERE f.fk_supervisor = 2;


DROP TABLE funcionario;
DROP TABLE areas;


-- ----------------------------------------------------------------------
-- ATT 2

CREATE DATABASE sprint2;
USE sprint2;

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fk_gerente INT,
    CONSTRAINT fk_gerente
    FOREIGN KEY (fk_gerente)
    REFERENCES usuario(id_usuario)
);

CREATE TABLE email (
    id_email INT PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(220),
    fk_usuario INT,
    CONSTRAINT fk_usuario
    FOREIGN KEY (fk_usuario)
    REFERENCES usuario(id_usuario)
);

INSERT INTO usuario (nome) VALUES 
('Mateus'),
('André');

INSERT INTO usuario (nome, fk_gerente) VALUES
('Jhonatan', 1),
('Celia', 2),
('Ana', 2);

INSERT INTO email (endereco, fk_usuario) VALUES
('mateus@gmail.com', 1),
('andre@gmail.com', 2),
('jhonatan@gmail.com', 3),
('celia@gmail.com', 4),
('ana@gmail.com', 5),
('mateus2.0@gmail.com', 1);

UPDATE usuario SET fk_gerente = 1 WHERE id_usuario = 2;

SELECT 
u.nome AS usuario,
e.endereco AS email
FROM usuario u
JOIN email e
ON u.id_usuario = e.fk_usuario;

SELECT 
u.nome AS usuario,
e.endereco AS email
FROM usuario u
JOIN email e
ON u.id_usuario = e.fk_usuario
WHERE u.nome = 'Mateus';

SELECT 
u.nome AS usuario,
e.endereco AS email,
CASE 
    WHEN u.fk_gerente IS NULL THEN 'Sem gerente'
    ELSE 'Possui gerente'
END AS situacao
FROM usuario u
JOIN email e
ON u.id_usuario = e.fk_usuario;




