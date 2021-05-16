.mode columns
.headers on
.nullvalue NULL

/*
	Esta interrogação destina-se a retornar os Géneros
	de Conteúdo e a respetiva frequência que cada Utilizador (com vários perfis)
	mais visualizou.
	Notas: 
		- No caso de haver mais que um máximo, retorna todos com valor máximo
		- No caso de um Utilizador não ter histórico, surge com o Género a NULL e frequencia = 0
*/

DROP VIEW IF EXISTS GeneroFrequencias;

CREATE VIEW GeneroFrequencias AS 
SELECT email, tipo, count(*) AS frequencia
FROM (
	Utilizador INNER JOIN Perfil ON (Utilizador.email = Perfil.emailUtilizador)
	INNER JOIN Historico ON (Historico.idPerfil = Perfil.id)
	INNER JOIN GeneroConteudo ON (GeneroConteudo.idConteudo = Historico.idConteudo)
)
GROUP BY Utilizador.email, tipo;


SELECT email, tipo, frequencia
FROM (
	GeneroFrequencias AS FrequenciasMax
	INNER JOIN 
	(
		SELECT email, max(frequencia) AS maxFrequenciaUtilizador
		FROM GeneroFrequencias
		GROUP BY email
	)
	USING (email)
)
WHERE (
	frequencia = maxFrequenciaUtilizador
)
UNION
SELECT DISTINCT email, NULL, 0
FROM (
	Utilizador INNER JOIN Perfil ON (Utilizador.email = Perfil.emailUtilizador)
)
WHERE (
	Perfil.id NOT IN (
			SELECT DISTINCT idPerfil FROM Historico
		)
)