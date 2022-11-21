CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
tipo VARCHAR(255) NOT NULL,
categoria VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
quantidade INT NOT NULL,
controlado BOOLEAN NOT NULL,
peso INT NOT NULL,
valor DECIMAL(5,2) NOT NULL,
categoria_id BIGINT,
PRIMARY KEY(id),
FOREIGN KEY(categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO  tb_categorias(tipo,categoria)
VALUES
("Gota","Fármaceaticos"),
("Comprimido","Caps"),
("Injetável","Hormônio"),
("Comprimido","Remédio"),
("Injetável","Vacina");



INSERT INTO tb_produtos(nome,quantidade,controlado,peso,valor,categoria_id)
VALUES
("Testosterona",70,true,20,180.00,2),
("gotinha",3,true,200,200.00,3),
("Dipirona",20,false,30,10.00,1),
("Pfizer",1, true,10,200.00,5),
("Decongex",20,false,30,5.99,4),
("Astrazenica",2,true,250,220.99,3),
("Dorflex",42,false,120,85.00,4),
("Paracetamol",12,false,500,4.99,4);

DESCRIBE tb_produtos;

SELECT * FROM tb_produtos WHERE valor > 50.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 5 AND 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%c%";

SELECT * FROM tb_produtos
INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;

SELECT * FROM tb_produtos 
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

SELECT * FROM tb_produtos 
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
where tipo like "%Injetável%";