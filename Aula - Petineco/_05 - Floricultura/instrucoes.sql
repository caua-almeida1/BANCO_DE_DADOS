-- Tabela Flor
CREATE TABLE Flor (
    CodigoIdentificacao INTEGER PRIMARY KEY,
    NomeCientifico TEXT,
    NomePopular TEXT,
    Preco DECIMAL(10, 2),
    QuantidadeEmEstoque INTEGER,
    CoresDisponiveis TEXT
);

-- Tabela Cliente
CREATE TABLE Cliente (
    CPF TEXT PRIMARY KEY,
    Nome TEXT,
    Telefone TEXT,
    EnderecoEntrega TEXT
);

-- Tabela Pedido
CREATE TABLE Pedido (
    NumeroPedido INTEGER PRIMARY KEY,
    DataRealizacao DATE,
    ValorTotal DECIMAL(10, 2),
    DataEntrega DATE,
    HorarioEntrega TIME,
    CPF_Cliente TEXT,
    FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF)
);

-- Tabela ItemPedido
CREATE TABLE ItemPedido (
    NumeroPedido INTEGER,
    CodigoIdentificacaoFlor INTEGER,
    Quantidade INTEGER,
    PRIMARY KEY (NumeroPedido, CodigoIdentificacaoFlor),
    FOREIGN KEY (NumeroPedido) REFERENCES Pedido(NumeroPedido),
    FOREIGN KEY (CodigoIdentificacaoFlor) REFERENCES Flor(CodigoIdentificacao)
);



-- Populando Tabelas

INSERT INTO Flor (CodigoIdentificacao, NomeCientifico, NomePopular, Preco, QuantidadeEmEstoque, CoresDisponiveis) VALUES
    (1, 'Rosa spp.', 'Rosa', 12.50, 50, 'Vermelha, Branca, Amarela'),
    (2, 'Tulipa spp.', 'Tulipa', 8.75, 30, 'Vermelha, Rosa, Amarela'),
    (3, 'Orquídea spp.', 'Orquídea', 25.00, 20, 'Branca, Lilás, Rosa');

INSERT INTO Cliente (CPF, Nome, Telefone, EnderecoEntrega) VALUES
    ('123.456.789-01', 'Ana Silva', '(11) 98765-4321', 'Rua A, 123'),
    ('987.654.321-01', 'Carlos Oliveira', '(22) 99876-5432', 'Rua B, 456'),
    ('111.222.333-44', 'Mariana Santos', '(33) 98888-7777', 'Rua C, 789');


INSERT INTO Pedido (NumeroPedido, DataRealizacao, ValorTotal, DataEntrega, HorarioEntrega, CPF_Cliente) VALUES
    (1, '2023-01-15', 40.00, '2023-01-20', '15:00', '123.456.789-01'),
    (2, '2023-02-20', 35.00, '2023-02-25', '14:30', '987.654.321-01'),
    (3, '2023-03-25', 75.00, '2023-04-01', '16:00', '111.222.333-44');


INSERT INTO ItemPedido (NumeroPedido, CodigoIdentificacaoFlor, Quantidade) VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 3),
    (3, 1, 1),
    (3, 2, 2);
