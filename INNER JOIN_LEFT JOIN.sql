/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Sebastião Oliveira Silva Neto - 2011478
DATA: 23/03/2023 
*/

/*Nessa consulta, é selecionado o nome da estrela, nome e tipo do planeta, 
onde a temperatura da estrela é menor que 3000 K.
É feito um INNER JOIN entre as tabelas Estrelas e Planetas com base no ID da estrela.*/
SELECT Estrelas.nome, Planetas.nome, Planetas.tipo
FROM Estrelas
INNER JOIN Planetas ON Estrelas.id = Planetas.id_estrela
WHERE Estrelas.temperatura < 3000;

/*Nessa consulta, é selecionado o nome da galáxia, nome e tipo da estrela, 
onde o tipo da galáxia é "Espirais Barradas". 
É feito um INNER JOIN entre as tabelas Galaxias e Estrelas com base no ID da galáxia.*/
SELECT Galaxias.nome, Estrelas.nome, Estrelas.tipo
FROM Galaxias
INNER JOIN Estrelas ON Galaxias.id = Estrelas.id_galaxia
WHERE Galaxias.tipo_galaxia = 'Espirais Barradas';

/*Nessa consulta, é selecionado o nome da galáxia e a quantidade de estrelas que pertencem a ela. 
É feito um LEFT JOIN entre as tabelas Galaxias e Estrelas com base no ID da galáxia, 
para que todas as galáxias sejam incluídas na consulta, mesmo que não possuam estrelas. 
Em seguida, é feito um GROUP BY pelo ID da galáxia, para que a quantidade de estrelas seja contabilizada para cada galáxia.*/
SELECT Galaxias.nome, COUNT(Estrelas.id)
FROM Galaxias
LEFT JOIN Estrelas ON Galaxias.id = Estrelas.id_galaxia
GROUP BY Galaxias.id;

