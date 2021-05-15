.mode columns
.headers on
.nullvalue NULL


-- Esta interrogação destina-se a ir buscar todos os conteudos com classificação maior que 4.8 
-- e que um dado utilizador (neste caso, perfil = 1) ainda não tenha visto
-- neste caso como tem de ser maior que 4.8 só pode aparecer Game of Thrones que tem 4.9

SELECT titulo, classificacao
FROM Conteudo
WHERE Conteudo.classificacao > 4.8 and Conteudo.id not in (
	SELECT idConteudo
	FROM Historico 
	WHERE Historico.idPerfil = 1 
	)