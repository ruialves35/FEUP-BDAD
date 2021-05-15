-- Para facilitar a verificação
select * from Historico;
select * from Favorito;

-- Deve falhar
insert into Favorito values(2, 1);

-- Deve funcionar
insert into Favorito values(1, 4);

select * from Favorito;

select * from Recomendado;

-- Deve falhar
insert into Recomendado values(1, 1, 50);

-- Deve funcionar
insert into Recomendado values(1, 5, 50);

select * from Recomendado;