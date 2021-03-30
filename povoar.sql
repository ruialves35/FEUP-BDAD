PRAGMA foreign_keys=on;

insert into Conta values ("user1@gmail.com", "user123");
insert into Conta values ("admin@gmail.com", "admin123");

insert into Utilizador values ("user1@gmail.com", 1, 69420, 0);

insert into Admin values ("admin@gmail.com", "Sr. Vigilante");

insert into Perfil values (1, "perfil1", "www.imagem1.com", "EN", "user1@gmail.com");

insert into Conteudo values (1, "Naruto", "2002-10-03", "Um rapaz encontra uma rapoza de 9 caudas e juntos vao numa aventura", 9, 5, "Studio Pierrot");
insert into Conteudo values (2, "Interstellar", "2014-06-11", "Um homem sente a responsabilidade de ir para o espaço para encontrar um planeta habitável", 14, 5, "Warner Bros");
insert into Conteudo values (3, "Queens Gambit", "2020-10-23", "Uma rapariga perde os seus pais em criança e descobre a sua paixao no xadrez", 15, 4.3, "Netflix");
insert into Conteudo values (4, "Queens Gambit Behind the Scenes", "2020-10-24", "Behind the scenes da série de sucesso: Queens Gambit", 15, 4, "Netflix");

insert into Genero values ("acao");
insert into Genero values ("comedia");
insert into Genero values ("romance");
insert into Genero values ("animacao");
insert into Genero values ("anime");
insert into Genero values ("documentario");
insert into Genero values ("drama");
insert into Genero values ("ficcao");
insert into Genero values ("terror");	

insert into GeneroConteudo values (1, "anime");

insert into Filme values (2, 150, "Filme Interstellar");

insert into Serie values (1);

insert into ConteudoEspecial values (4, 60, "Behind the Scene da série Queens Gambit", 3);

insert into Temporada values (1, 1, 1);

insert into Episodio values (1, 24, "Naruto Episódio 1", "A aventura de Naruto começa", 1);

insert into Qualidade values (144);
insert into Qualidade values (240);
insert into Qualidade values (480);
insert into Qualidade values (720);
insert into Qualidade values (1080);
insert into Qualidade values (1440);
insert into Qualidade values (2160);

insert into ConteudoEspecialQualidade values (4, 2160, "www.umconteudobemespecial.com");

insert into FilmeQualidade values (2, 1080, "www.umfilmefixe.com");

insert into EpisodioQualidade values (1, 720, "www.umhomemvaiparaoespacoechora.com");

insert into Favorito values (1, 1);
insert into Favorito values (1, 2);

insert into Historico values (1, 1, "2021-01-01");
insert into Historico values (1, 2, "2021-02-21");
insert into Historico values (1, 4, "2021-03-26");

insert into Recomendado values (1, 3, 97);