.mode columns
.headers on
.nullvalue NULL

--Esta interrogação destina-se a mostrar o nome de todos os conteudos
-- que sejam dum dado genero (neste caso vou fazer de ficcao)

SELECT titulo
FROM Conteudo
WHERE Conteudo.id in (	
	SELECT idConteudo 
	FROM GeneroConteudo
	WHERE GeneroConteudo.tipo = 'acao' 
	)