/*
Curso de Engenharia de Software - UniEVANGÉLICA 
Disciplina de Sistemas Gerenciadores de Banco de Dados 
Dev: Sebastião Oliveira Silva Neto - 2011478
DATA: 17/04/2023 
*/

/*criação de função para calcular a massa total de uma galáxia*/
DELIMITER //
CREATE FUNCTION calcular_massa_total_galaxia(id_galaxia INT)
RETURNS REAL
BEGIN
DECLARE total_massa REAL;
SELECT SUM(massa) INTO total_massa FROM Estrelas WHERE id_galaxia = id_galaxia;
RETURN total_massa;
END //
DELIMITER ;

/*criação de procedure para atualizar a idade das estrelas*/
DELIMITER //
CREATE PROCEDURE atualizar_idade_estrelas()
BEGIN
UPDATE Estrelas SET idade = idade + 1;
END //
DELIMITER ;

/*criação de trigger para registrar a descoberta de novos cometas*/
CREATE TRIGGER registrar_descoberta_cometa AFTER INSERT ON Cometas
FOR EACH ROW
BEGIN
INSERT INTO Eventos (descricao) VALUES (NEW.nome + ' foi descoberto em ' + NEW.data_descoberta);
END;

/*criação de evento para atualizar a distância dos planetas em relação à sua estrela*/
CREATE EVENT atualizar_distancia_planetas
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
UPDATE Planetas SET distancia_estrela = distancia_estrela * 1.01;
END;

/*criação de view para listar informações de uma galáxia e suas estrelas*/
CREATE VIEW informacoes_galaxia AS
SELECT g.nome AS nome_galaxia, g.tipo AS tipo_galaxia, g.distancia AS distancia_galaxia,
e.nome AS nome_estrela, e.tipo AS tipo_estrela, e.temperatura AS temperatura_estrela, e.magnitude AS magnitude_estrela
FROM Galaxias g JOIN Estrelas e ON g.id = e.id_galaxia;

/*atribuição de permissões aos usuários do sistema*/
GRANT SELECT ON Galaxias TO usuario1;
GRANT SELECT, INSERT, UPDATE, DELETE ON Estrelas TO usuario2;
GRANT EXECUTE ON PROCEDURE atualizar_idade_estrelas TO usuario3;
GRANT TRIGGER ON Cometas TO usuario4;
GRANT EVENT, UPDATE ON Planetas TO usuario5;
GRANT SELECT ON informacoes_galaxia TO usuario6;