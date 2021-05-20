.mode columns
.headers on
.nullvalue NULL


-- Esta query destina-se a obter os filmes, conteudos especiais e séries
-- cuja resolução é a resolução máxima de todos os conteudos. No caso das séries todos os
-- episódios da série têm de ter resolução máxima


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
	or Conteudo.id in (
		SELECT Serie.idConteudo
		FROM Serie
		WHERE Serie.idConteudo not in (
			SELECT Temporada.idSerie
			FROM Temporada NATURAL JOIN Episodio 
					JOIN EpisodioQualidade ON Episodio.id = EpisodioQualidade.idEpisodio
			WHERE EpisodioQualidade.resolucao < (
				SELECT max(EpisodioQualidade.resolucao)
				FROM EpisodioQualidade
			)
		)
	)
