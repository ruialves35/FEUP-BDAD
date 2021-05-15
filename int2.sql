.mode columns
.headers on
.nullvalue NULL


--Esta interrogação destina-se a obter todos os filmes que um dado utilizador (neste caso 1)
-- ainda não tenha visto

SELECT titulo
FROM Conteudo JOIN Filme ON Conteudo.id = Filme.idConteudo
WHERE Conteudo.id not in (
	SELECT idConteudo
	FROM Historico
	WHERE Historico.idPerfil = 1
	)
