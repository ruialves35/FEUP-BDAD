.mode columns
.headers on
.nullvalue NULL



-- Selecionar todos os perfis que já viram todos os géneros de conteúdo do site
DROP VIEW IF EXISTS GenerosHistorico;
CREATE VIEW GenerosHistorico AS
SELECT Perfil.id, GeneroConteudo.tipo
FROM Historico JOIN Perfil ON Perfil.id = Historico.idPerfil
	JOIN GeneroConteudo ON Historico.idConteudo = GeneroConteudo.idConteudo
GROUP BY Historico.idPerfil, GeneroConteudo.tipo;

SELECT *
FROM Perfil
WHERE Perfil.id not in (
	SELECT Perfil.id
	FROM Genero, Perfil
	WHERE (Perfil.id, Genero.tipo) not in GenerosHistorico
	);
