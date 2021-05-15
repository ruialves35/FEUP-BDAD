.mode columns
.headers on
.nullvalue NULL


-- Esta query destina-se a obter o numero de episodios por série

SELECT titulo, sum(numeroEpisodiosTemporada) as numeroEpisodiosSerie
FROM Serie
	JOIN ( 	
		SELECT idSerie, count(*) as numeroEpisodiosTemporada
		FROM Temporada
		JOIN Episodio using (idTemporada)
		GROUP BY idTemporada
		) as TemporadaNumEpisodios ON TemporadaNumEpisodios.idSerie = Serie.idConteudo
	JOIN Conteudo ON Serie.idConteudo = Conteudo.id
GROUP BY Serie.idConteudo
