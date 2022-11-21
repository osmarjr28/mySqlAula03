CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
localDeCorte VARCHAR(255) NOT NULL,
categoria VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
peso INT NOT NULL,
vacuo BOOLEAN NOT NULL,
valor DECIMAL(5,2)NOT NULL,
categoria_id BIGINT,
PRIMARY KEY(id),
FOREIGN KEY(categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO  tb_categorias(localDeCorte,categoria)
VALUES
("Traseiro","Bovino"),
("Dianteiro","Bovino"),
("Dianteiro","Peixe"),
("Traseiro","Peixe"),
("Traseiro","Ave"),
("Dianteiro","Ave");



INSERT INTO tb_produtos(nome,peso,vacuo,valor,categoria_id)
VALUES
("Picanha Argentina",1000,true,179.90,1),
("Acém",2000,false,33.90,2),
("Patinho",500,false,19.90,3),
("Asinha de frango",1230, true,25.90,4),
("Salmão",1170,true,129.90,6),
("Contra Filé",1093,false,69.90,5),
("Peito de frango",3900,true,49.90,6),
("Rabada Bovina",700,false,15.99,1);

DESCRIBE tb_produtos;

SELECT * FROM tb_produtos WHERE valor > 80.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%c%";

SELECT * FROM tb_produtos
INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;

SELECT * FROM tb_produtos 
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE categoria LIKE "%Ave%";