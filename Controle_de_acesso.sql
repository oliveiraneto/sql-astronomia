/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Sebastião Oliveira Silva Neto - 2011478
DATA: 23/04/2023 
*/

-- Criação da view Relatorio com informações das tabelas Galaxias, Estrelas, Planetas, Cometas e Astronomos
CREATE VIEW Relatorio AS
SELECT Galaxias.nome AS Nome_Galaxia, -- Seleciona o nome da galáxia da tabela Galaxias
        Estrelas.nome AS Nome_Estrela, -- Seleciona o nome da estrela da tabela Estrelas
        Planetas.nome AS Nome_Planeta, -- Seleciona o nome do planeta da tabela Planetas
        Cometas.nome AS Nome_Cometa, -- Seleciona o nome do cometa da tabela Cometas
        Astronomos.nome AS Nome_Astronomo, -- Seleciona o nome do astrônomo da tabela Astronomos
        Astronomos.especialidade AS Especialidade_Astronomo -- Seleciona a especialidade do astrônomo da tabela Astronomos
FROM Galaxias
LEFT JOIN Estrelas ON Estrelas.id_galaxia = Galaxias.id -- Realiza um join da tabela Estrelas com a tabela Galaxias utilizando o campo id_galaxia
LEFT JOIN Planetas ON Planetas.id_estrela = Estrelas.id -- Realiza um join da tabela Planetas com a tabela Estrelas utilizando o campo id_estrela
LEFT JOIN Cometas ON Cometas.id = 1 -- Realiza um join da tabela Cometas com valor 1 (inexistente) para evitar erros de sintaxe
LEFT JOIN Astronomos ON Astronomos.id = 1; -- Realiza um join da tabela Astronomos com valor 1 (inexistente) para evitar erros de sintaxe

-- Criação do usuário view_user com permissão de acesso somente para a view Relatorio
CREATE USER 'view_user'@'localhost' IDENTIFIED BY 'neto2020';

GRANT SELECT ON astronomia.Relatorio TO 'view_user'@'localhost';

-- Criação do usuário read_only_user com permissão de acesso somente para leitura em todas as tabelas do banco de dados astronomia
CREATE USER 'read_only_user'@'localhost' IDENTIFIED BY 'neto2020';

GRANT SELECT ON astronomia.* TO 'read_only_user'@'localhost';