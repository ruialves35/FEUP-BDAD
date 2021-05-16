.mode columns
.headers on
.nullvalue NULL

/*
	Esta interrogação destina-se a listar o Conteúdo
	com mais sucesso de cada Estúdio e de cada Ano (Ordenado por ordem crescente)
*/ 

DROP VIEW IF EXISTS ClassificacoesMaxAno;
DROP VIEW IF EXISTS ConteudoAno;

CREATE VIEW ConteudoAno AS 
SELECT *, strftime('%Y', dataLancamento, 'utc') as ano
FROM Conteudo;

CREATE VIEW ClassificacoesMaxAno AS
SELECT estudio, ano, max(classificacao) AS classificacaoMax
FROM ConteudoAno
GROUP BY estudio, ano;

SELECT titulo, ConteudoAno.ano, classificacao, ConteudoAno.estudio
FROM (
	ConteudoAno
	INNER JOIN 
	ClassificacoesMaxAno
	ON 
		(ClassificacoesMaxAno.classificacaoMax = ConteudoAno.classificacao and ConteudoAno.estudio = ClassificacoesMaxAno.estudio
			and ClassificacoesMaxAno.ano = ConteudoAno.ano
		)
)
ORDER BY ConteudoAno.estudio ASC,
		 ConteudoAno.ano ASC; 