.mode columns
.headers on
.nullvalue NULL

-- Esta interrogação destina-se a ir buscar a qualidade máxima de um 
-- episodio de uma dada temporada de uma série especifica
-- Neste caso vou buscar o Episodio 3 da temporada 3 de
-- Game of Thrones

SELECT max(resolucao)
FROM EpisodioQualidade
	JOIN Episodio ON EpisodioQualidade.idEpisodio = Episodio.id
	JOIN Temporada using (idTemporada)
WHERE Episodio.num = 3 and Temporada.idTemporada = 3 and Temporada.idSerie in (
	SELECT idConteudo
	FROM Serie JOIN Conteudo ON Serie.idConteudo = Conteudo.id
	WHERE Conteudo.titulo = 'Game of Thrones'
	)
--GROUP BY EpisodioQualidade
