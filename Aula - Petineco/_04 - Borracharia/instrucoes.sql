CREATE TABLE Pneu (
    NumeroSerie INTEGER PRIMARY KEY,
    Marca TEXT,
    Modelo TEXT,
    Dimensoes TEXT,
    QuantidadeEmEstoque INTEGER
);

CREATE TABLE Cliente (
    CPF TEXT PRIMARY KEY,
    Nome TEXT,
    Telefone TEXT,
    Endereco TEXT
);


CREATE TABLE Servico (
    NumeroOrdemServico INTEGER PRIMARY KEY,
    DataRealizacao DATE,
    Valor DECIMAL(10, 2),
    CPF_Cliente TEXT,
    FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF)
);

CREATE TABLE Servico_Pneu (
    NumeroOrdemServico INTEGER,
    NumeroSeriePneu INTEGER,
    PRIMARY KEY (NumeroOrdemServico, NumeroSeriePneu),
    FOREIGN KEY (NumeroOrdemServico) REFERENCES Servico(NumeroOrdemServico),
    FOREIGN KEY (NumeroSeriePneu) REFERENCES Pneu(NumeroSerie)
);


--Populando Tabelas

INSERT INTO Pneu (NumeroSerie, Marca, Modelo, Dimensoes, QuantidadeEmEstoque) VALUES
    (1, 'Michelin', 'Pilot Sport 4', '205/55R16', 50),
    (2, 'Bridgestone', 'Ecopia EP150', '195/65R15', 30),
    (3, 'Pirelli', 'Cinturato P7', '225/45R17', 40);


INSERT INTO Cliente (CPF, Nome, Telefone, Endereco) VALUES
    ('123.456.789-01', 'Carlos Silva', '(11) 98765-4321', 'Rua A, 123'),
    ('987.654.321-01', 'Ana Oliveira', '(22) 99876-5432', 'Rua B, 456'),
    ('111.222.333-44', 'Mariana Santos', '(33) 98888-7777', 'Rua C, 789');


INSERT INTO Servico (NumeroOrdemServico, DataRealizacao, Valor, CPF_Cliente) VALUES
    (1, '2023-01-15', 150.00, '123.456.789-01'),
    (2, '2023-02-20', 200.00, '987.654.321-01'),
    (3, '2023-03-25', 120.00, '111.222.333-44');


INSERT INTO Servico_Pneu (NumeroOrdemServico, NumeroSeriePneu) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 1),
    (3, 3);



