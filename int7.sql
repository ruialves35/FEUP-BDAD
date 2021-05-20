.mode columns
.headers on
.nullvalue NULL

/* 
	Esta interrogação destina-se a ir buscar uma contagem do género dos filmes
	que o perfil de um utilizador (neste caso o perfil de id 1) viu, mas que
	não adicionou aos favoritos (provavelmente não gostou). Para além disso, inclui a percentagem de cada categoria.
*/

DROP VIEW IF EXISTS FavoritosUtilizador;
DROP VIEW IF EXISTS HistoricoUtilizador;
DROP VIEW IF EXISTS ConteudoGeneroInfo;

CREATE VIEW FavoritosUtilizador AS
SELECT *
FROM Perfil JOIN Favorito ON (Perfil.id = Favorito.idPerfil and Perfil.id = 1);

CREATE VIEW HistoricoUtilizador AS
SELECT *
FROM Perfil JOIN Historico ON (Perfil.id = Historico.idPerfil and Perfil.id = 1);

CREATE VIEW ConteudoGeneroInfo AS
SELECT *
FROM Conteudo JOIN GeneroConteudo ON (Conteudo.id = GeneroConteudo.idConteudo);

SELECT tipo, numConteudo, (CAST(numConteudo AS FLOAT) / totalConteudo) * 100 AS "frequencia (%)"
FROM (
		SELECT tipo, count(*) as numConteudo
		FROM HistoricoUtilizador JOIN ConteudoGeneroInfo ON (HistoricoUtilizador.idConteudo = ConteudoGeneroInfo.id)
		WHERE HistoricoUtilizador.idConteudo NOT IN (
			SELECT idConteudo FROM FavoritosUtilizador
		)
		GROUP BY tipo
	)
CROSS JOIN (
	SELECT HistoricoUtilizador.id, count(*) as totalConteudo
	FROM HistoricoUtilizador JOIN ConteudoGeneroInfo ON (HistoricoUtilizador.idConteudo = ConteudoGeneroInfo.id)
	WHERE HistoricoUtilizador.idConteudo NOT IN (
		SELECT idConteudo FROM FavoritosUtilizador
	)
);
