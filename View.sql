/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Sebastião Oliveira Silva Neto - 2011478
DATA: 17/04/2023 
*/

/* Criando uma VIEW para um relatório de astronomia */
CREATE VIEW relatorio_astronomia AS

/* Selecionando as colunas necessárias */
SELECT g.nome AS 'Galaxia', 
       e.nome AS 'Estrela', 
       e.massa AS 'Massa da estrela',
       p.nome AS 'Planeta', 
       p.tipo AS 'Tipo de planeta', 
       p.nome AS 'Cometas'
       c.distancia AS 'Distancia do cometa'
       p.nome AS 'Astronomos'
       a.tipo AS 'Tipo do astronomo',
       p.nome AS 'boracos negros'
       b.massa AS 'Massa do buraco negro',
       p.distancia_estrela AS 'Distancia do planeta para a estrela', 
       p.periodo_orbital AS 'Periodo orbital do planeta'
       g.distancia AS 'Distancia da galaxia'

/* Juntando as tabelas Galaxias, Estrelas, Buracos Negros, Planetas, Cometas e Astronomos */
FROM Galaxias g
JOIN Estrelas e ON g.id = e.id_galaxia
JOIN Buracos_Negros b ON g.id = b.id_galaxia
JOIN Planetas p ON e.id = p.id_estrela
JOIN Cometas c ON c.id = 1 / substitua 1 pelo id do cometa desejado /
JOIN Astronomos a ON a.especialidade = g.nome; /* assume que a especialidade do astronomo é o nome da galaxia em que ele se especializa */

-- Criação do usuário "astro_user"
CREATE USER astro_user IDENTIFIED BY 'neto123';

-- Concessão de permissões somente para visualizar a View "relatorio_astronomia"
GRANT SELECT ON astronomia.relatorio_astronomia TO astro_user;
