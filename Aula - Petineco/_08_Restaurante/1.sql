BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "tb_mesas" (
	"mesa_id"	INTEGER,
	"numero"	TEXT NOT NULL,
	"capacidade"	TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS "tb_pedidos" (
	"pedido_id"	INTEGER,
	"mesa_id"	TEXT NOT NULL,
	"produto_id"	TEXT NOT NULL,
	"quantidade"	TEXT NOT NULL,
	"total"	TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS "tb_produtos" (
	"produto_id"	INTEGER,
	"nome"	TEXT NOT NULL,
	"tipo"	TEXT NOT NULL,
	"preco"	TEXT NOT NULL,
	"descricao"	TEXT NOT NULL
);
INSERT INTO "tb_produtos" ("produto_id","nome","tipo","preco","descricao") VALUES (1,'Frango Grelhado','Prato Principal','15.99','Peito de frango grelhado com legumes.'),
 (2,'Coca-Cola','Bebida','2.5','Refrigerante de cola gelado.'),
 (3,'Tiramisu','Sobremesa','6.99','Sobremesa italiana com café e queijo mascarpone.'),
 (4,'Salada Caesar','Prato Principal','9.99','Salada de alface, croutons e molho Caesar.'),
 (5,'Suco de Laranja','Bebida','3.0','Suco natural de laranja.'),
 (6,'Cheesecake de Morango','Sobremesa','7.99','Cheesecake com cobertura de morango.'),
 (7,'Lasanha','Prato Principal','12.99','Lasanha de carne com molho de tomate e queijo.'),
 (8,'Água Mineral','Bebida','1.5','Água mineral sem gás.');
COMMIT;
