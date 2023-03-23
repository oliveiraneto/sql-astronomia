/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Sebastião Oliveira Silva Neto - 2011478
DATA: 23/03/2023 
*/

SELECT Galaxias.nome, Estrelas.nome, Planetas.nome /*Seleciona o nome da galáxia, nome da estrela e nome do planeta*/
FROM Galaxias, Estrelas, Planetas /*Faz uma combinação entre as três tabelas*/
WHERE Estrelas.id_galaxia = Galaxias.id /*Faz a relação entre a tabela Estrelas e Galaxias com base no ID da galáxia*/
AND Planetas.id_estrela = Estrelas.id /*Faz a relação entre a tabela Planetas e Estrelas com base no ID da estrela*/
AND Galaxias.nome = 'Via Láctea'; /*Filtrando apenas as galáxias com nome 'Via Láctea'*/
