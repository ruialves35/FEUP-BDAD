PRAGMA foreign_keys=on;

insert into Conta values ("user1@gmail.com", "user123");
insert into Conta values ("admin@gmail.com", "admin123");

insert into Utilizador values ("user1@gmail.com", 1, 69420, 0);

insert into Admin values ("admin@gmail.com", "Sr. Vigilante");

insert into Perfil values (1, "perfil1", "www.imagem1.com", "EN", "user1@gmail.com");

insert into Conteudo values (1, "NARUTO", "2002-10-03", "Um rapaz encontra uma rapoza de 9 caudas e juntos vao numa aventura", 9, 5, "Studio Pierrot");
insert into Conteudo values (2, "Interstellar", "2009-10-10", "Um Homem vai para o espaco", 9, 5, "Studio Pierrot");
insert into Conteudo values (3, "NARUTO", "2002-10-03", "Um rapaz encontra uma rapoza de 9 caudas e juntos vao numa aventura", 9, 5, "Studio Pierrot");


insert into Genero values ("acao");
insert into Genero values ("comedia");
insert into Genero values ("anime");

insert into GeneroConteudo values (1, "anime");

insert into Filme values (1, 24, "")