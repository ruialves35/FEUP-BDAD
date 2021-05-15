select * from Temporada;

-- Deve apagar a Temporada 1
delete from Episodio where id=1;

select * from Temporada;

select * from Serie;

-- Deve Apagar a Serie 3
delete from Temporada where idTemporada=5 or idTemporada=6;

select * from Serie;