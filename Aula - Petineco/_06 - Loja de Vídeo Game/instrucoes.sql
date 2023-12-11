--CRIAÇÃO TABELAS

CREATE TABLE Plataformas (
    cod_plataforma INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    fabricante TEXT
);

CREATE TABLE Jogos (
    cod_jogo INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    genero TEXT,
    lancamento DATE,
    cod_plataforma INTEGER,
    FOREIGN KEY (cod_plataforma) REFERENCES Plataformas(cod_plataforma)
);



--POPULANDO COM ALGUNS JOGOS

INSERT INTO Plataformas (nome, fabricante) VALUES
    ('PlayStation 5', 'Sony'),
    ('Xbox Series X', 'Microsoft'),
    ('Nintendo Switch', 'Nintendo');

INSERT INTO Jogos (titulo, genero, lancamento, cod_plataforma) VALUES
    ('Spider-Man: Miles Morales', 'Ação', '2020-11-12', 1),
    ('Halo Infinite', 'Ação', '2021-12-08', 2),
    ('The Legend of Zelda: Breath of the Wild', 'Aventura', '2017-03-03', 3),
    ('Demon''s Souls', 'RPG', '2020-11-12', 1),
    ('Forza Horizon 5', 'Corrida', '2021-11-09', 2),
    ('Animal Crossing: New Horizons', 'Simulação', '2020-03-20', 3),
    ('Final Fantasy VII Remake', 'RPG', '2020-04-10', 1),
    ('FIFA 22', 'Esportes', '2021-10-01', 2),
    ('Super Mario Odyssey', 'Aventura', '2017-10-27', 3),
    ('Cyberpunk 2077', 'RPG', '2020-12-10', 1);



--CONSULTA EM ALGUMA PLATAFORMA ESPECIFICA

SELECT * FROM Jogos WHERE cod_plataforma = (SELECT cod_plataforma FROM Plataformas WHERE nome = 'PlayStation 5');



--CONSULTA POR ALGUM GENERO ESPECIFICO

SELECT * FROM Jogos WHERE genero = 'Aventura';




--CONSULTA COM INNER JOIN

SELECT Plataformas.nome AS NomePlataforma, Plataformas.fabricante AS FabricantePlataforma,
       Jogos.titulo AS TituloJogo, Jogos.lancamento, Jogos.genero
FROM Jogos
INNER JOIN Plataformas ON Jogos.cod_plataforma = Plataformas.cod_plataforma;




--MUDANDO A DATA DE LANÇAMENTO DE ALGUNS JOGOS

UPDATE Jogos SET lancamento = '2022-01-15' WHERE cod_jogo IN (1, 3, 5, 7);




--EXCLUINDO ALGUNS JOGOS A PARTIR DE SEUS IDS

DELETE FROM Jogos WHERE cod_jogo IN (2, 4, 6, 8);
