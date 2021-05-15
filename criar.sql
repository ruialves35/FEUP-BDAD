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
	email TEXT PRIMARY KEY CONSTRAINT emailFormat CHECK (email LIKE '%_@__%.__%'),
	password TEXT NOT NULL CONSTRAINT passwordLength CHECK (length(password) >= 5)
);

CREATE TABLE Utilizador (
	email TEXT PRIMARY KEY REFERENCES Conta ON DELETE CASCADE ON UPDATE CASCADE,
	pago INTEGER NOT NULL CONSTRAINT pagoIsBool CHECK (pago = 0 or pago = 1),
	preco INTEGER NOT NULL CONSTRAINT precoPositivo CHECK (preco > 0),
	premium INTEGER NOT NULL CONSTRAINT premiumIsBool CHECK (premium = 0 or premium = 1) DEFAULT (0)
);

CREATE TABLE Admin (
	email TEXT PRIMARY KEY REFERENCES Conta ON DELETE CASCADE ON UPDATE CASCADE,
	nome TEXT NOT NULL
);

CREATE TABLE Perfil (
	id INTEGER PRIMARY KEY,
	nome TEXT NOT NULL,
	avatar TEXT,
	linguagem TEXT NOT NULL CONSTRAINT linguagemValida CHECK (linguagem in ("EN", "PT", "DE", "FR", "ES", "IT", "RU", "JAP", "NIG", "CHI")),
	emailUtilizador TEXT REFERENCES Utilizador ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Conteudo (
	id INTEGER PRIMARY KEY,
	titulo TEXT NOT NULL,
	dataLancamento TEXT NOT NULL CONSTRAINT dataLancamentoConteudo CHECK (strftime('%Y-%m-%d', dataLancamento) < strftime('%Y-%m-%d')),
	descricao TEXT,
	idadeMinima INTEGER NOT NULL CONSTRAINT idadeMinima CHECK (idadeMinima > 0),
	classificacao REAL NOT NULL CONSTRAINT classificacao CHECK (classificacao >= 0 and classificacao <= 5),
	estudio TEXT
); 

CREATE TABLE Genero (
	tipo TEXT PRIMARY KEY CONSTRAINT tipoValido CHECK ( tipo in ("acao", "comedia", "romance", "animacao", "anime", "documentario", "drama", "ficcao", "terror") )
);

CREATE TABLE GeneroConteudo (
	idConteudo INTEGER REFERENCES Conteudo ON DELETE CASCADE ON UPDATE CASCADE,
	tipo TEXT REFERENCES Genero ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (idConteudo, tipo)
);

CREATE TABLE Filme (
	idConteudo INTEGER PRIMARY KEY REFERENCES Conteudo ON DELETE CASCADE ON UPDATE CASCADE,
	duracao REAL NOT NULL CONSTRAINT duracaoPositiva CHECK (duracao > 0),
	sinopse TEXT
);

CREATE TABLE Serie (
	idConteudo INTEGER PRIMARY KEY REFERENCES Conteudo ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ConteudoEspecial (
	idConteudo INTEGER PRIMARY KEY REFERENCES Conteudo ON DELETE CASCADE ON UPDATE CASCADE,
	duracao REAl NOT NULL CONSTRAINT duracaoPositiva CHECK (duracao > 0),
	sinopse TEXT,
	idConteudoIncidido INTEGER REFERENCES Conteudo ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Temporada (
	idTemporada INTEGER PRIMARY KEY,
	numero INTEGER NOT NULL CONSTRAINT numeroPositivo CHECK (numero > 0),
	idSerie INTEGER REFERENCES Serie ON DELETE CASCADE ON UPDATE CASCADE,
	UNIQUE (numero, idSerie)
);

CREATE TABLE Episodio (
	id INTEGER PRIMARY KEY,
	num INTEGER NOT NULL CONSTRAINT num CHECK (num > 0),
	duracao REAL NOT NULL CONSTRAINT duracaoPositiva CHECK (duracao > 0),
	titulo TEXT NOT NULL,
	sinopse TEXT,
	idTemporada INTEGER REFERENCES Temporada ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Qualidade (
	resolucao INTEGER PRIMARY KEY CONSTRAINT resolucaoValida CHECK (resolucao in (144, 240, 480, 720, 1080, 1440, 2160))
);

CREATE TABLE ConteudoEspecialQualidade(
	idConteudo INTEGER REFERENCES ConteudoEspecial ON DELETE CASCADE ON UPDATE CASCADE,
	resolucao INTEGER REFERENCES Qualidade ON DELETE CASCADE ON UPDATE CASCADE,
	videoURL TEXT NOT NULL,
	PRIMARY KEY (idConteudo, resolucao)
);

CREATE TABLE FilmeQualidade(
	idFilme INTEGER REFERENCES Filme ON DELETE CASCADE ON UPDATE CASCADE,
	resolucao INTEGER REFERENCES Qualidade ON DELETE CASCADE ON UPDATE CASCADE,
	videoURL TEXT NOT NULL,
	PRIMARY KEY (idFilme, resolucao)
);

CREATE TABLE EpisodioQualidade(
	idEpisodio INTEGER REFERENCES Episodio ON DELETE CASCADE ON UPDATE CASCADE,
	resolucao INTEGER REFERENCES Qualidade ON DELETE CASCADE ON UPDATE CASCADE,
	videoURL TEXT NOT NULL,
	PRIMARY KEY (idEpisodio, resolucao)
);

CREATE TABLE Favorito (
	idPerfil INTEGER REFERENCES Perfil ON DELETE CASCADE ON UPDATE CASCADE,
	idConteudo INTEGER REFERENCES Conteudo ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (idPerfil, idConteudo)
);

CREATE TABLE Historico (
	idPerfil INTEGER REFERENCES Perfil ON DELETE CASCADE ON UPDATE CASCADE,
	idConteudo INTEGER REFERENCES Conteudo ON DELETE CASCADE ON UPDATE CASCADE,
	dataVisualizacao TEXT NOT NULL CONSTRAINT dataVisualizacaoHistorico CHECK (strftime('%Y-%m-%d', dataVisualizacao) < strftime('%Y-%m-%d')),
	PRIMARY KEY (idPerfil, idConteudo)
);

CREATE TABLE Recomendado (
	idPerfil INTEGER REFERENCES Perfil ON DELETE CASCADE ON UPDATE CASCADE,
	idConteudo INTEGER REFERENCES Conteudo ON DELETE CASCADE ON UPDATE CASCADE,
	taxaRelevancia INTEGER CONSTRAINT relevanciaPercentagem CHECK (taxaRelevancia >= 0 and taxaRelevancia <= 100),
	PRIMARY KEY (idPerfil, idConteudo)
);
