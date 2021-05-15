.mode columns
.headers on
.nullvalue NULL


-- Esta query destina-se a obter os filmes e conteudos especiais
-- cuja resolução é a resolução máxima de todos os conteudos


SELECT Conteudo.titulo
FROM Conteudo
WHERE Conteudo.id in ( 
		SELECT idFilme 
		FROM FilmeQualidade 
		WHERE FilmeQualidade.resolucao = ( SELECT max(resolucao) FROM Qualidade ) 
	)
	or 
	Conteudo.id in ( 
		SELECT idConteudo 
		FROM ConteudoEspecialQualidade 
		WHERE ConteudoEspecialQualidade.resolucao = (SELECT max(resolucao) FROM Qualidade) 
	)
