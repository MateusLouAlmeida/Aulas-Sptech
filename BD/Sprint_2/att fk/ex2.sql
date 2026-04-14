CREATE DATABASE sprint2;
USE sprint2;

CREATE TABLE Musica (
    idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

CREATE TABLE Album (
    idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    tipo VARCHAR(10), 
    dtLancamento DATE,
    CONSTRAINT cttipo
    CHECK (tipo IN('digital', 'fisico'))
);


INSERT INTO Musica (titulo, artista, genero) VALUES
('Holy Diver', 'Dio', 'Rock'),
('Rainbow in the Dark', 'Dio', 'Rock'),
('Oh Lori', 'Alessi Brothers', 'Pop'),
('Walk Like an Egyptian', 'The Bangles', 'Pop'),
('Killer Queen', 'Queen', 'Rock'),
('D4C', 'AC/DC', 'Rock');

INSERT INTO Album (nome, tipo, dtLancamento) VALUES
('Rock & Roll', 'fisico', '2000-09-12'),
('Pop JOJO', 'digital', '1917-04-13');

ALTER TABLE Musica
ADD COLUMN idAlbum INT,
ADD CONSTRAINT fkAlbum
FOREIGN KEY (idAlbum)
REFERENCES Album(idAlbum);

UPDATE Musica SET idAlbum = 1 WHERE idMusica IN (1,2,5,6);
UPDATE Musica SET idAlbum = 2 WHERE idMusica IN (3,4);

SELECT * FROM Musica;
SELECT * FROM Album;

SELECT 
    m.titulo,
    m.artista,
    a.nome AS Album
FROM Musica m
JOIN Album a
ON m.idAlbum = a.idAlbum;

SELECT 
    m.titulo,
    m.artista,
    a.nome,
    a.tipo
FROM Musica m
JOIN Album a
ON m.idAlbum = a.idAlbum
WHERE a.tipo = 'digital';

SELECT 
    m.titulo,
    m.artista,
    a.nome AS Album,
    a.tipo
FROM Musica m
JOIN Album a
ON m.idAlbum = a.idAlbum;

SELECT 
    m.titulo,
    m.artista,
    CASE 
        WHEN m.artista IN ('Dio', 'Queen') THEN 'JoJo refference'
        ELSE 'Semi JoJo Reference'
    END AS Referencia
FROM Musica m;
