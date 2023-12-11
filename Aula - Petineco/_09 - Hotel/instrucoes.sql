--CRIANDO TABELAS

CREATE TABLE tb_hospede (
    hospede_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    documento TEXT,
    telefone TEXT
);

CREATE TABLE tb_quarto (
    quarto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT NOT NULL,
    preco_diaria DECIMAL(10, 2) NOT NULL,
    status TEXT NOT NULL
);

CREATE TABLE tb_reserva (
    reserva_id INTEGER PRIMARY KEY AUTOINCREMENT,
    hospede_id INTEGER,
    quarto_id INTEGER,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    FOREIGN KEY (hospede_id) REFERENCES tb_hospede(hospede_id),
    FOREIGN KEY (quarto_id) REFERENCES tb_quarto(quarto_id)
);



--POPULANDO TABELAS

INSERT INTO tb_hospede (nome, documento, telefone) VALUES
    ('João Silva', '123456789', '(11) 98765-4321'),
    ('Maria Oliveira', '987654321', '(22) 99876-5432'),
    ('Carlos Santos', '111222333', '(33) 98888-7777'),
    ('Ana Souza', '444555666', '(44) 99999-8888'),
    ('Pedro Pereira', '777888999', '(77) 98888-7777'),
    ('Julia Lima', '123123123', '(11) 11111-1111'),
    ('Roberto Rocha', '456456456', '(45) 12345-6789'),
    ('Fernanda Fernandes', '789789789', '(78) 98765-4321');

INSERT INTO tb_quarto (tipo, preco_diaria, status) VALUES
    ('Simples', 100.00, 'disponível'),
    ('Duplo', 150.00, 'disponível'),
    ('Suíte', 200.00, 'manutenção'),
    ('Simples', 120.00, 'disponível'),
    ('Duplo', 180.00, 'ocupado'),
    ('Suíte', 220.00, 'disponível'),
    ('Simples', 110.00, 'disponível'),
    ('Duplo', 160.00, 'manutenção');

INSERT INTO tb_reserva (hospede_id, quarto_id, data_entrada, data_saida) VALUES
    (1, 1, '2023-01-15', '2023-01-20'),
    (2, 3, '2023-02-20', '2023-02-25'),
    (3, 5, '2023-03-25', '2023-04-01'),
    (4, 2, '2023-04-10', '2023-04-15'),
    (5, 6, '2023-05-01', '2023-05-05'),
    (6, 4, '2023-06-15', '2023-06-20'),
    (7, 7, '2023-07-10', '2023-07-15'),
    (8, 8, '2023-08-20', '2023-08-25'),
    (1, 2, '2023-09-05', '2023-09-10'),
    (3, 3, '2023-10-15', '2023-10-20');




--CONSULTA DE ALGUM HOSPEDE APARTIR DE SEU DOCUMENTO
SELECT * FROM tb_hospede WHERE documento = '123456789';




--CONSULTA DE ALGUM HOSPEDE APARTIR DE SEU ID
SELECT nome, documento, telefone FROM tb_hospede WHERE hospede_id = 2;




--CONSULTA DE QUARTOS PELOS SEUS TIPOS
SELECT * FROM tb_quarto WHERE tipo = 'Simples';




--CONSULTA PELO PREÇO DA DIARIA 
SELECT * FROM tb_quarto WHERE preco_diaria > 150.00;




--CONSULTA DE QUANTOS QUARTOS TEM DISPONIVEL
SELECT COUNT(*) FROM tb_quarto WHERE status = 'disponível';





--EXIBINDO INFORMAÇÕES DA TABELA RESERVA COM INNER JOIN

SELECT tb_hospede.nome, tb_hospede.documento, tb_quarto.tipo, tb_quarto.preco_diaria, tb_quarto.status,
       tb_reserva.reserva_id, tb_reserva.data_entrada, tb_reserva.data_saida
FROM tb_reserva
INNER JOIN tb_hospede ON tb_reserva.hospede_id = tb_hospede.hospede_id
INNER JOIN tb_quarto ON tb_reserva.quarto_id = tb_quarto.quarto_id;




--CONSULTANDO COM O INNER JOIN APENAS OS QUARTOS OCUPADOS

SELECT tb_hospede.nome, tb_hospede.documento, tb_quarto.tipo, tb_quarto.preco_diaria, tb_quarto.status,
       tb_reserva.reserva_id, tb_reserva.data_entrada, tb_reserva.data_saida
FROM tb_reserva
INNER JOIN tb_hospede ON tb_reserva.hospede_id = tb_hospede.hospede_id
INNER JOIN tb_quarto ON tb_reserva.quarto_id = tb_quarto.quarto_id
WHERE tb_quarto.status = 'ocupado';




--ALTERANDO REGISTROS DA TABELA HOSPEDE

UPDATE tb_hospede SET nome = 'João da Silva' WHERE hospede_id = 1;

UPDATE tb_hospede SET telefone = '(11) 99999-9999' WHERE hospede_id = 3;

UPDATE tb_hospede SET documento = '777777777' WHERE hospede_id = 5;

UPDATE tb_hospede SET nome = 'Fernanda Oliveira' WHERE hospede_id = 8;

UPDATE tb_hospede SET telefone = '(44) 77777-8888' WHERE hospede_id = 6;





--ALTERANDO REGISTROS DA TABELA QUARTO


UPDATE tb_quarto SET preco_diaria = 130.00 WHERE quarto_id = 1;

UPDATE tb_quarto SET status = 'manutenção' WHERE quarto_id = 3;

UPDATE tb_quarto SET preco_diaria = 190.00 WHERE quarto_id = 5;

UPDATE tb_quarto SET status = 'ocupado' WHERE quarto_id = 8;

UPDATE tb_quarto SET status = 'disponível' WHERE quarto_id = 7;





--EXCLUINDO INFORMAÇÕES DA TABELA RESERVA

DELETE FROM tb_reserva WHERE reserva_id = 1;

DELETE FROM tb_reserva WHERE reserva_id = 3;

DELETE FROM tb_reserva WHERE reserva_id = 5;

DELETE FROM tb_reserva WHERE reserva_id = 7;

DELETE FROM tb_reserva WHERE reserva_id = 9;
