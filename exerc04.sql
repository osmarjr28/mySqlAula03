CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT,
tipo VARCHAR(255) NOT NULL,
licenciatura VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE tb_cursos(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
cargaHoraria INT NOT NULL,
matricula VARCHAR(255) NOT NULL,
valor DECIMAL(8,2) NOT NULL,
categoria_id BIGINT,
PRIMARY KEY(id),
FOREIGN KEY(categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO  tb_categorias(tipo,licenciatura)
VALUES
("Médicina","Bacharel"),
("Médicina","Doutorado"),
("Médicina","Pós-Doutorado"),
("Tecnologia","Bacharel"),
("Tecnologia","Doutorado"),
("Tecnologia","Pós-Doutorado");

INSERT INTO tb_cursos(nome,cargaHoraria,matricula,valor,categoria_id)
VALUES
("Arquiteto de Software",600,"d041fi5",700.00,4),
("Engenharia de Software",750,"c9f9aas2",920.00,5),
("Engenharia da Computação",750,"daq2wo6",130.00,6),
("Analise e Desenvolvimento de Sistemas",450,"kakaka9",459.00,4),
("Biomedicina",600,"kjs2ji6",350.00,1),
("Fisioterapia",3000,"oi2sad4",10970.00,2),
("Enfermagem",780,"se6eas1",780.00,3),
("Nutrição",200,"lalala92t",570,3);

DESCRIBE tb_cursos;

SELECT * FROM tb_cursos WHERE valor > 500.00;

SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome LIKE "%j%";

SELECT * FROM tb_cursos
INNER JOIN tb_categorias 
ON tb_cursos.categoria_id = tb_categorias.id;

SELECT * FROM tb_cursos
INNER JOIN tb_categorias
ON tb_cursos.categoria_id = tb_categorias.id
WHERE tipo LIKE "%Tecnologia%";