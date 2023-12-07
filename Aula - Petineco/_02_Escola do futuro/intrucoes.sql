-- Tabela Aluno
CREATE TABLE Aluno (
    Matricula INTEGER PRIMARY KEY,
    Nome TEXT,
    CPF TEXT,
    RG TEXT,
    DataNascimento DATE,
    Endereco TEXT
);

-- Tabela Curso
CREATE TABLE Curso (
    CodigoCurso INTEGER PRIMARY KEY,
    NomeCurso TEXT,
    CargaHoraria INTEGER
);

-- Tabela Professor
CREATE TABLE Professor (
    NumeroRegistro INTEGER PRIMARY KEY,
    Nome TEXT,
    Especialidade TEXT,
    Contato TEXT
);

-- Tabela Matricula
CREATE TABLE Matricula (
    NumeroMatricula INTEGER PRIMARY KEY,
    Matricula_Aluno INTEGER,
    Matricula_Curso INTEGER,
    Matricula_Professor INTEGER,
    QuadroNotas TEXT,
    FOREIGN KEY (Matricula_Aluno) REFERENCES Aluno(Matricula),
    FOREIGN KEY (Matricula_Curso) REFERENCES Curso(CodigoCurso),
    FOREIGN KEY (Matricula_Professor) REFERENCES Professor(NumeroRegistro)
);




-- Inseririndo dados na tabela Aluno
INSERT INTO Aluno (Nome, CPF, RG, DataNascimento, Endereco) VALUES
    ('João Silva', '123.456.789-01', '1234567', '1990-05-15', 'Rua A, 123'),
    ('Maria Oliveira', '987.654.321-01', '7654321', '1992-08-20', 'Rua B, 456'),
    ('Carlos Santos', '111.222.333-44', '9876543', '1988-02-10', 'Rua C, 789');

-- Inseririndo dados na tabela Curso
INSERT INTO Curso (NomeCurso, CargaHoraria) VALUES
    ('Informática', 80),
    ('Inglês', 60),
    ('Administração', 100);

-- Inseririndo dados na tabela Professor
INSERT INTO Professor (Nome, Especialidade, Contato) VALUES
    ('Prof. Souza', 'Programação', 'prof.souza@email.com'),
    ('Prof. Lima', 'Inglês Avançado', 'prof.lima@email.com'),
    ('Prof. Pereira', 'Gestão de Negócios', 'prof.pereira@email.com');

-- Inseririndo dados na tabela Matricula
INSERT INTO Matricula (Matricula_Aluno, Matricula_Curso, Matricula_Professor, QuadroNotas) VALUES
    (1, 1, 1, '8.5, 7.0, 9.0, 8.0'),
    (2, 2, 2, '9.0, 9.5, 8.0, 7.5'),
    (3, 3, 3, '7.5, 8.0, 9.0, 9.5');

