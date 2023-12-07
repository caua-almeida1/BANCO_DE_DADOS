BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "tb_usuarios" (
	"usuario_id"	INTEGER,
	"CPF"	TEXT NOT NULL,
	"Nome"	TEXT NOT NULL,
	"DataNascimento"	TEXT NOT NULL,
	"Telefone1"	TEXT NOT NULL,
	"Telefone2"	TEXT,
	"Rua"	TEXT NOT NULL,
	"Numero"	TEXT NOT NULL,
	"CEP"	TEXT NOT NULL,
	"Complemento"	TEXT NOT NULL,
	"Bairro"	TEXT NOT NULL,
	"Cidade"	TEXT NOT NULL,
	"Estado"	TEXT NOT NULL,
	PRIMARY KEY("usuario_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tb_rotas" (
	"rotas_id"	INTEGER,
	"cod_rotas"	INTEGER,
	"cod_voo"	INTEGER,
	"origem"	TEXT NOT NULL,
	"destino"	TEXT NOT NULL,
	"modelo"	TEXT NOT NULL
);
COMMIT;
