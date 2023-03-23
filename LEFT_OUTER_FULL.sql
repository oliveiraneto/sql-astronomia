/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Sebastião Oliveira Silva Neto - 2011478
DATA: 23/03/2023 
*/

/*O LEFT JOIN é usado para combinar todas as linhas da tabela da esquerda 
(a tabela que aparece antes do JOIN) com as correspondentes da tabela da direita 
(a tabela que aparece depois do JOIN), incluindo as linhas da tabela da esquerda que não têm correspondência na tabela da direita. 
Por exemplo, se quisermos listar todos os planetas e a estrela que eles orbitam, 
mesmo que alguns planetas não tenham estrela associada, podemos usar um LEFT JOIN entre as tabelas Planetas e Estrelas:*/
SELECT Planetas.nome, Estrelas.nome
FROM Planetas
LEFT JOIN Estrelas ON Planetas.id_estrela = Estrelas.id;

/*O OUTER JOIN (também conhecido como FULL OUTER JOIN) combina todas as linhas de ambas as tabelas, 
incluindo as linhas sem correspondência em ambas as tabelas. 
Por exemplo, se quisermos listar todas as estrelas e todos os planetas, 
incluindo aqueles que não têm estrela associada, podemos usar um OUTER JOIN entre as tabelas Estrelas e Planetas:*/
SELECT Estrelas.nome, Planetas.nome
FROM Estrelas
FULL OUTER JOIN Planetas ON Estrelas.id = Planetas.id_estrela;

/* FULL JOIN poderia ser utilizado em um banco de dados de astronomia seria para comparar os dados de duas tabelas diferentes, 
uma com informações sobre galáxias e outra com informações sobre estrelas, 
onde alguns registros podem não ter uma correspondência direta nas outras tabelas.*/
SELECT 
    Planetas.nome AS Planeta,
    Estrelas.nome AS Estrela,
    Galaxias.nome AS Galaxia
FROM 
    Planetas
    FULL JOIN Estrelas ON Planetas.id_estrela = Estrelas.id
    FULL JOIN Galaxias ON Estrelas.id_galaxia = Galaxias.id
ORDER BY 
    Galaxias.nome ASC,
    Estrelas.nome ASC,
    Planetas.nome ASC;

