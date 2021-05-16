/*
1. EASY - operador IN
2. EASY - JOIN / NOT IN
3. MEDIUM - MAX / MULTIPLE JOINS / IN / WHERES
4. MEDIUM - SUM / COUNT / JOIN / GROUP BY
5. EASY - > / NOT IN 
6. IN / MAX / OR
7. VIEWS / COUNT / JOIN / IN/ GROUP BY

*/

/* Esta interrogação destina-se a ir buscar uma contagem do género dos filmes
	que o perfil de um utilizador (neste caso o perfil de id 1) viu, mas que
	não adicionou aos favoritos. Para além disso, inclui a percentagem de cada categoria.
*/

DROP VIEW FavoritosUtilizador;
DROP VIEW HistoricoUtilizador;
DROP VIEW ConteudoGeneroInfo;

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
