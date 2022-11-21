CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
tipo VARCHAR(255) NOT NULL,
tamanho VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE tb_pizzas(
id BIGINT AUTO_INCREMENT,
sabor VARCHAR(255) NOT NULL,
adicional VARCHAR(255),
borda_recheada BOOLEAN NOT NULL,
valor DECIMAL(5,2) NOT NULL,
categoria_id BIGINT,
PRIMARY KEY(id),
FOREIGN KEY(categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO  tb_categorias(tipo,tamanho)
VALUES
("Pizza Salgada","Broto"),
("Pizza Salgada","Grande"),
("Pizza Salgada","Gigante"),
("Pizza Doce","Broto"),
("Pizza Doce","Grande"),
("Pizza Doce","Gigante");

INSERT INTO tb_pizzas(sabor,adicional,borda_recheada,valor,categoria_id)
VALUES
("Marguerita",null,true,59.99,2),
("Calabresa C/ Mussarela","Azeitona",false,42.99,3),
("Frango C/ Catupiry",null,true,45.99,1),
("4 Queijos","Adicionar catupiry", true,68.99,3),
("Brigadeiro","Colocar chocolate ao invés de nutella",false,25.99,1),
("Carne C/ Cebola","Mussarela",true,35.99,2),
("M&M",null,true,46.99,5),
("Nutella",null,false,78.99,6);

DESCRIBE tb_pizzas;

SELECT * FROM tb_pizzas WHERE valor > 45.00;

SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE sabor LIKE"%m%";

SELECT * FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id;

SELECT sabor FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.categoria_id = tb_categorias.id
WHERE tb_categorias.tipo = "Doce";