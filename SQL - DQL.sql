/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Sebastião Oliveira Silva Neto - 2011478
DATA: 23/03/2023 
*/

/*= (igual): usado para comparar se um valor é igual a outro valor*/
SELECT * FROM Galaxias WHERE nome = 'Via Lactea';

/*(maior que): usado para comparar se um valor é maior que outro valor*/
SELECT * FROM Estrelas WHERE temperatura > 5000;

/*Selecionando todas as estrelas de uma galáxia específica com temperatura superior a 5000 graus Kelvin*/
SELECT * FROM Estrelas
WHERE id_galaxia = 1 AND temperatura > 5000;

/*Selecionando todos os planetas que orbitam uma estrela específica e têm um tipo específico ou uma distância da estrela superior a 1 unidade astronômica*/
SELECT * FROM Planetas
WHERE id_estrela = 5 AND (tipo = 'terrestre' OR distancia_estrela > 1);

/*Selecionando planetas com período orbital entre 100 e 200 dias*/
SELECT * FROM Planetas 
WHERE periodo_orbital BETWEEN 100 AND 200;

/*Selecionando estrelas com temperatura abaixo de 5000 graus Kelvin*/
SELECT * FROM Estrelas
WHERE temperatura < 5000;

/*Selecionando todos os planetas cujo nome começa com a letra "E"*/
SELECT * FROM Planetas WHERE nome LIKE 'E%';

/*Selecionando todos os astrônomos que possuem "ar" em seu nome*/
SELECT * FROM Astronomos WHERE nome LIKE '%ar%';

/*Consulta para obter a soma da massa de todas as galáxias*/
SELECT SUM(massa) as soma_massa FROM Galaxias;

/*Consulta para obter a média de temperatura das estrelas de uma determinada galáxia*/
SELECT AVG(temperatura) as media_temperatura FROM Estrelas WHERE id_galaxia = 1;

/*Consulta para obter a quantidade de planetas de uma determinada estrela*/
SELECT COUNT(*) as qtde_planetas FROM Planetas WHERE id_estrela = 3;

/*Consulta para obter o valor máximo da magnitude das estrelas de uma determinada galáxia*/
SELECT MAX(magnitude) as max_magnitude FROM Estrelas WHERE id_galaxia = 2;
