PRAGMA foreign_keys=on;
.mode columns
.headers on

DROP TABLE IF EXISTS Recomendado;
DROP TABLE IF EXISTS Historico;
DROP TABLE IF EXISTS Favorito;
DROP TABLE IF EXISTS Perfil;
DROP TABLE IF EXISTS Utilizador;
DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS Conta;
DROP TABLE IF EXISTS GeneroConteudo;
DROP TABLE IF EXISTS ConteudoEspecialQualidade;
DROP TABLE IF EXISTS EpisodioQualidade;
DROP TABLE IF EXISTS FilmeQualidade;
DROP TABLE IF EXISTS Episodio;
DROP TABLE IF EXISTS Temporada;
DROP TABLE IF EXISTS Filme;
DROP TABLE IF EXISTS Serie;
DROP TABLE IF EXISTS ConteudoEspecial;
DROP TABLE IF EXISTS Conteudo;
DROP TABLE IF EXISTS Genero;
DROP TABLE IF EXISTS Qualidade;

CREATE TABLE Conta (
	email TEXT PRIMARY KEY,
	password TEXT CONSTRAINT passwordLength CHECK (length(password) >= 5)
);

CREATE TABLE Utilizador (
	email TEXT PRIMARY KEY REFERENCES Conta,
	pago INTEGER CONSTRAINT pagoIsBool CHECK (pago = 0 or pago = 1),
	preco INTEGER CONSTRAINT precoPositivo CHECK (preco > 0),
	premium INTEGER CONSTRAINT premiumIsBool CHECK (premium = 0 or premium = 1)
);

CREATE TABLE Admin (
	email TEXT PRIMARY KEY REFERENCES Conta,
	nome TEXT NOT NULL
);

CREATE TABLE Perfil (
	id INTEGER PRIMARY KEY,
	nome TEXT NOT NULL,
	avatar TEXT,
	linguagem TEXT NOT NULL,
	emailUtilizador TEXT REFERENCES Utilizador
);

CREATE TABLE Conteudo (
	id INTEGER PRIMARY KEY,
	titulo TEXT NOT NULL,
	dataLancamento TEXT NOT NULL,
	descricao TEXT,
	idadeMinima INTEGER CONSTRAINT idadeMinima CHECK (idadeMinima > 0),
	classificacao REAL CONSTRAINT classificacao CHECK (classificacao >= 0 and classificacao <= 5),
	estudio TEXT
); 

CREATE TABLE Genero (
	tipo TEXT PRIMARY KEY CONSTRAINT tipoValido CHECK ( tipo in ("acao", "comedia", "romance", "animacao", "anime", "documentario", "drama", "ficcao", "terror") )
);

CREATE TABLE GeneroConteudo (
	idConteudo INTEGER REFERENCES Conteudo,
	tipo TEXT REFERENCES Genero,
	PRIMARY KEY (idConteudo, tipo)
);

CREATE TABLE Filme (
	idConteudo INTEGER PRIMARY KEY REFERENCES Conteudo,
	duracao REAL CONSTRAINT duracaoPositiva CHECK (duracao > 0),
	sinopse TEXT
);

CREATE TABLE Serie (
	idConteudo INTEGER PRIMARY KEY REFERENCES Conteudo
);

CREATE TABLE ConteudoEspecial (
	idConteudo INTEGER PRIMARY KEY REFERENCES Conteudo,
	duracao REAl CONSTRAINT duracaoPositiva CHECK (duracao > 0),
	sinopse TEXT,
	idConteudoIncidido INTEGER REFERENCES Conteudo
);

CREATE TABLE Temporada (
	idTemporada INTEGER PRIMARY KEY,
	numero INTEGER CONSTRAINT numeroPositivo CHECK (numero > 0),
	idSerie INTEGER REFERENCES Serie,
	UNIQUE (numero, idSerie)
);

CREATE TABLE Episodio (
	id INTEGER PRIMARY KEY,
	duracao REAL CONSTRAINT duracaoPositiva CHECK (duracao > 0),
	titulo TEXT,
	sinopse TEXT,
	idTemporada INTEGER REFERENCES Temporada
);

CREATE TABLE Qualidade (
	resolucao INTEGER PRIMARY KEY CONSTRAINT resolucaoValida CHECK (resolucao in (144, 240, 480, 720, 1080, 1440, 2160))
);

CREATE TABLE ConteudoEspecialQualidade(
	idConteudo INTEGER REFERENCES ConteudoEspecial,
	resolucao INTEGER REFERENCES Qualidade,
	PRIMARY KEY (idConteudo, resolucao)
);

CREATE TABLE FilmeQualidade(
	idFilme INTEGER REFERENCES Filme,
	resolucao INTEGER REFERENCES Qualidade,
	PRIMARY KEY (idFilme, resolucao)
);

CREATE TABLE EpisodioQualidade(
	idEpisodio INTEGER REFERENCES Episodio,
	resolucao INTEGER REFERENCES Qualidade,
	PRIMARY KEY (idEpisodio, resolucao)
);

CREATE TABLE Favorito (
	idPerfil INTEGER REFERENCES Perfil,
	idConteudo INTEGER REFERENCES Conteudo,
	PRIMARY KEY (idPerfil, idConteudo)
);

CREATE TABLE Historico (
	idPerfil INTEGER REFERENCES Perfil,
	idConteudo INTEGER REFERENCES Conteudo,
	dataVisualizacao TEXT NOT NULL,
	PRIMARY KEY (idPerfil, idConteudo)
);

CREATE TABLE Recomendado (
	idPerfil INTEGER REFERENCES Perfil,
	idConteudo INTEGER REFERENCES Conteudo,
	taxaRelevancia INTEGER CONSTRAINT relevanciaPercentagem CHECK (taxaRelevancia >= 0 and taxaRelevancia <= 100),
	PRIMARY KEY (idPerfil, idConteudo)
);
