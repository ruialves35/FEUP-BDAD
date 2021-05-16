PRAGMA foreign_keys=on;

INSERT INTO Conta VALUES ("user1@gmail.com", "user123");
INSERT INTO Conta VALUES ("admin@gmail.com", "admin123");
INSERT INTO Conta VALUES ("sqlite@gmail.com", "sqlite");
INSERT INTO Conta VALUES ("hannamontana@gmail.com", "montanha");
INSERT INTO Conta VALUES ("mongodb@gmail.com", "mongo");
INSERT INTO Conta VALUES ("mulherdoadmin@gmail.com", "admina123");

INSERT INTO Utilizador VALUES ("user1@gmail.com", 1, 15, 1);
INSERT INTO Utilizador VALUES ("sqlite@gmail.com", 0, 10, 1);
INSERT INTO Utilizador VALUES ("mongodb@gmail.com", 1, 5, 0);
INSERT INTO Utilizador VALUES ("hannamontana@gmail.com", 0, 5, 0);

INSERT INTO Admin VALUES ("admin@gmail.com", "Sr. Vigilante");
INSERT INTO Admin VALUES ("mulherdoadmin@gmail.com", "Sra. Vigilante");

INSERT INTO Perfil VALUES (1, "perfil1", "www.imagem1.com", "EN", "user1@gmail.com");
INSERT INTO Perfil VALUES (2, "perfil2", "www.imagem2.com", "PT", "user1@gmail.com");
INSERT INTO Perfil VALUES (3, "perfil3", "www.imagem3.com", "ES", "sqlite@gmail.com");
INSERT INTO Perfil VALUES (4, "perfil4", "www.imagem4.com", "FR", "mongodb@gmail.com");
INSERT INTO Perfil VALUES (5, "perfil5", "www.imagem5.com", "EN", "hannamontana@gmail.com");

INSERT INTO Conteudo VALUES (1, "Naruto", strftime('%Y-%m-%d', "2002-10-03", 'utc'), "Um rapaz encontra uma rapoza de 9 caudas e juntos vao numa aventura", 9, 5, "Studio Pierrot");
INSERT INTO Conteudo VALUES (2, "Interstellar", strftime('%Y-%m-%d', "2014-06-11",'utc'), "Um homem sente a responsabilidade de ir para o espaço para encontrar um planeta habitável", 14, 5, "Warner Bros");
INSERT INTO Conteudo VALUES (3, "Queens Gambit", strftime('%Y-%m-%d', "2020-10-23", 'utc'), "Uma rapariga perde os seus pais em criança e descobre a sua paixao no xadrez", 15, 4.3, "Netflix");
INSERT INTO Conteudo VALUES (4, "Queens Gambit Behind the Scenes", strftime('%Y-%m-%d', "2020-10-24", 'utc'), "Behind the scenes da série de sucesso: Queens Gambit", 15, 4, "Netflix");
INSERT INTO Conteudo VALUES (5, "Harry Potter: Calice de Fogo", strftime('%Y-%m-%d', "2005-10-24", 'utc'), "Um maluco com uma varinha magica", 8, 5, "Warner Bros");
INSERT INTO Conteudo VALUES (6, "Jackie Chan", strftime('%Y-%m-%d', "1999-07-29", 'utc'), "Um honesto asiatico que perdeu os oculos e comecou a andar a porrada", 12, 4.5, "Golden Harvest");
INSERT INTO Conteudo VALUES (7, "Jackie Chan: Behind the Scenes", strftime('%Y-%m-%d', "1999-07-30", 'utc'), "Behind the scenes do filme: Jackie Chan", 8, 4, "Golden Harvest");
INSERT INTO Conteudo VALUES (8, "Harry Potter Behind the Scenes", strftime('%Y-%m-%d', "2005-10-27", 'utc'), "Behind the scenes do filme: Harry Potter", 8, 4.7, "Warner Bros");
INSERT INTO Conteudo VALUES(9, "Game of Thrones", strftime('%Y-%m-%d', "2011-04-17", 'utc'), "Reinos a atacarem se uns aos outros.", 16, 4.9, "HBO");

INSERT INTO Genero VALUES ("acao");
INSERT INTO Genero VALUES ("comedia");
INSERT INTO Genero VALUES ("romance");
INSERT INTO Genero VALUES ("animacao");
INSERT INTO Genero VALUES ("anime");
INSERT INTO Genero VALUES ("documentario");
INSERT INTO Genero VALUES ("drama");
INSERT INTO Genero VALUES ("ficcao");
INSERT INTO Genero VALUES ("terror");	

INSERT INTO GeneroConteudo VALUES (1, "anime");
INSERT INTO GeneroConteudo VALUES (1, "comedia");
INSERT INTO GeneroConteudo VALUES (2, "ficcao");
INSERT INTO GeneroConteudo VALUES (3, "drama");
INSERT INTO GeneroConteudo VALUES (4, "drama");
INSERT INTO GeneroConteudo VALUES (4, "documentario");
INSERT INTO GeneroConteudo VALUES (5, "ficcao");
INSERT INTO GeneroConteudo VALUES (6, "acao");
INSERT INTO GeneroConteudo VALUES (6, "comedia");
INSERT INTO GeneroConteudo VALUES (7, "documentario");
INSERT INTO GeneroConteudo VALUES (8, "documentario");
INSERT INTO GeneroConteudo VALUES (9, "acao");

INSERT INTO Filme VALUES (2, 150, "Filme Interstellar");
INSERT INTO Filme VALUES (5, 130, "O calice Ardeu e o Harry foi procurar uma justificacao para isso. Encontrou um monstro e andaram a atirar feitiços um ao outro.");
INSERT INTO Filme VALUES (6, 180, "Jackie perdeu os oculos e começaram lhe a bater porque ele nao via. Ele virou Lee Sin e começou a porrada.");

INSERT INTO Serie VALUES (1);
INSERT INTO Serie VALUES (3);
INSERT INTO Serie VALUES (9);

INSERT INTO ConteudoEspecial VALUES (4, 60, "Behind the Scene da série Queens Gambit", 3);
INSERT INTO ConteudoEspecial VALUES (8, 53, "Behind the Scene do filme Harry Potter", 5);
INSERT INTO ConteudoEspecial VALUES (7, 59, "Behind the Scene do filme Jackie Chan", 6);

INSERT INTO Temporada VALUES (1, 1, 1);
INSERT INTO Temporada VALUES (2, 1, 9);
INSERT INTO Temporada VALUES (3, 2, 9);
INSERT INTO Temporada VALUES (4, 3, 9);
INSERT INTO Temporada VALUES (5, 1, 3);
INSERT INTO Temporada VALUES (6, 2, 3);

INSERT INTO Episodio VALUES (1, 1, 24, "Naruto Episódio 1", "A aventura de Naruto começa", 1);
INSERT INTO Episodio VALUES (2, 2, 54, "Game of Thrones Episodio 2", "O inverno afinal nao e frio, isto vai aquecer.", 2);
INSERT INTO Episodio VALUES (3, 3, 58, "Game of Thrones Episodio 3", "Ja esta quente, tudo a batatada", 3);
INSERT INTO Episodio VALUES (7, 4, 58, "Game of Thrones Episodio 4", "Morreram os bons?", 3);
INSERT INTO Episodio VALUES (4, 4, 53, "Game of Thrones Ultimo Episodio", "Nao e o ultimo, vamos fazer mais para ganhar mais dinheiro", 4);
INSERT INTO Episodio VALUES (5, 1, 60, "Queens Gambit and the gamble", "As apostas comecam", 5);
INSERT INTO Episodio VALUES (6, 1, 58, "The mastermind", "As mentes brilhantes chocam", 6);

INSERT INTO Qualidade VALUES (144);
INSERT INTO Qualidade VALUES (240);
INSERT INTO Qualidade VALUES (480);
INSERT INTO Qualidade VALUES (720);
INSERT INTO Qualidade VALUES (1080);
INSERT INTO Qualidade VALUES (1440);
INSERT INTO Qualidade VALUES (2160);

INSERT INTO ConteudoEspecialQualidade VALUES (4, 2160, "www.umconteudobemespecial.com");
INSERT INTO ConteudoEspecialQualidade VALUES (8, 1080, "www.umconteudomeioespecial.com");
INSERT INTO ConteudoEspecialQualidade VALUES (7, 144, "www.umconteudopoucoespecial.com");
INSERT INTO ConteudoEspecialQualidade VALUES (7, 2160, "www.jackie.com");

INSERT INTO FilmeQualidade VALUES (2, 1080, "www.umfilmefixe.com");
INSERT INTO FilmeQualidade VALUES (2, 2160, "www.umfilmebemfixe.com");
INSERT INTO FilmeQualidade VALUES (5, 720, "www.umfilmenice.com");
INSERT INTO FilmeQualidade VALUES (6, 1080, "www.umfilmetop.com");

INSERT INTO EpisodioQualidade VALUES (1, 720, "www.umhomemvaiparaoespacoechora.com");
INSERT INTO EpisodioQualidade VALUES (1, 1080, "www.umhomemvaiparaoespacoechoramuito.com");
INSERT INTO EpisodioQualidade VALUES (2, 720, "www.invernoquentinho.com");
INSERT INTO EpisodioQualidade VALUES (3, 1080, "www.invernoaarder.com");
INSERT INTO EpisodioQualidade VALUES (3, 2160, "www.invernoaarder2.com");
INSERT INTO EpisodioQualidade VALUES (4, 2160, "www.naoeoultimoepisodio.com");
INSERT INTO EpisodioQualidade VALUES (5, 1080, "www.megadownload.com");
INSERT INTO EpisodioQualidade VALUES (6, 1080, "www.megadownload.com");

INSERT INTO Favorito VALUES (1, 1);
INSERT INTO Favorito VALUES (1, 2);
INSERT INTO Favorito VALUES (2, 3);
INSERT INTO Favorito VALUES (3, 4);
INSERT INTO Favorito VALUES (3, 5);
INSERT INTO Favorito VALUES (4, 6);

INSERT INTO Historico VALUES (1, 1, strftime('%Y-%m-%d', "2021-01-01", 'utc'));
INSERT INTO Historico VALUES (1, 2, strftime('%Y-%m-%d', "2021-02-21", 'utc'));
INSERT INTO Historico VALUES (1, 4, strftime('%Y-%m-%d', "2021-03-26", 'utc'));
INSERT INTO Historico VALUES (1, 5, strftime('%Y-%m-%d', "2021-03-29", 'utc'));
INSERT INTO Historico VALUES (1, 7, strftime('%Y-%m-%d', "2021-03-29", 'utc'));
INSERT INTO Historico VALUES (2, 3, strftime('%Y-%m-%d', "2021-02-14", 'utc'));
INSERT INTO Historico VALUES (3, 4, strftime('%Y-%m-%d', "2021-03-28", 'utc'));
INSERT INTO Historico VALUES (3, 5, strftime('%Y-%m-%d', "2021-03-12", 'utc'));
INSERT INTO Historico VALUES (4, 6, strftime('%Y-%m-%d', "2021-03-20", 'utc'));

INSERT INTO Recomendado VALUES (1, 3, 97);
INSERT INTO Recomendado VALUES (2, 4, 90);
INSERT INTO Recomendado VALUES (3, 9, 77);
INSERT INTO Recomendado VALUES (4, 7, 77);