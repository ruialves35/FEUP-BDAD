-- O serviço de base de dados deve apagar uma temporada, caso todos os episódios dela foram apagados.
-- Logicamente, se todas as temporadas de uma série forem apagadas, a série também terá de ser apagada

create trigger EpisodioApagado
after delete on Episodio
when (
    select count(*) from Episodio
    where idTemporada=old.idTemporada
)=0
begin
    delete from Temporada
    where idTemporada=old.idTemporada;
end;

create trigger TemporadaApagada
after delete on Temporada
when (
    select count(*) from Temporada
    where idSerie=old.idSerie
)=0
begin
    delete from Conteudo
    where id=old.idSerie;
end;