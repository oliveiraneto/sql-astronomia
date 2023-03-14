/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Sebastião Oliveira Silva Neto - 2011478
DATA: 14/03/2023 
*/

SELECT Estrelas.nome, Galaxias.nome, Galaxias.tipo_galaxia /*Seleciona o nome da estrela, nome da galáxia e tipo da galáxia*/
FROM Estrelas
INNER JOIN Galaxias ON Estrelas.id_galaxia = Galaxias.id /*Faz um INNER JOIN entre as tabelas Estrelas e Galaxias com base no ID da galáxia*/
WHERE Galaxias.nome = 'Via Láctea'; /*Filtrando apenas as estrelas que pertencem à galáxia Via Láctea*/

SELECT Planetas.nome, Estrelas.nome, Estrelas.temperatura/*Seleciona o nome do planeta, nome da estrela e temperatura da estrela*/
FROM Planetas
INNER JOIN Estrelas ON Planetas.id_estrela = Estrelas.id /*Faz um INNER JOIN entre as tabelas Planetas e Estrelas com base no ID da estrela*/
WHERE Estrelas.temperatura > 5000; /*Filtrando apenas os planetas que orbitam em torno de estrelas com temperatura acima de 5000 K*/

SELECT Astronomos.nome, Galaxias.nome /*Seleciona o nome do astrônomo e nome da galáxia*/
FROM Astronomos
INNER JOIN Estrelas ON Astronomos.id = Estrelas.id_astronomo /*Faz um INNER JOIN entre as tabelas Astronomos e Estrelas com base no ID do astrônomo*/
INNER JOIN Galaxias ON Estrelas.id_galaxia = Galaxias.id /*Faz um INNER JOIN entre as tabelas Estrelas e Galaxias com base no ID da galáxia*/
GROUP BY Astronomos.id /*Agrupa os resultados pelo ID do astrônomo*/
ORDER BY COUNT(Estrelas.id) DESC /*Ordena em ordem decrescente a quantidade de estrelas descobertas pelos astrônomos*/ 
LIMIT 1;/*Limitando a apenas um resultado*/
