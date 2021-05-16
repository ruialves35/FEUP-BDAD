.mode columns
.headers on
.nullvalue NULL

/*
	Esta interrogação destina-se a ir buscar todos os conteúdos
	especiais que obtiveram uma classificação igual ou superior ao 
	conteúdo sobre o qual incidem
*/

SELECT idConteudo, ConteudoEspecialInfo.titulo, ConteudoEspecialInfo.classificacao
FROM (
	ConteudoEspecial INNER JOIN Conteudo AS ConteudoEspecialInfo ON (ConteudoEspecial.idConteudo = ConteudoEspecialInfo.id)
	INNER JOIN Conteudo AS ConteudoIncidido ON (ConteudoEspecial.idConteudoIncidido = ConteudoIncidido.id)
)
WHERE (
	ConteudoEspecialInfo.classificacao >= ConteudoIncidido.classificacao
);