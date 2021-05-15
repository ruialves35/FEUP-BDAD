-- O sistema de base de dados não deve permitir inserir conteúdo que o perfil não viu na lista de favoritos.
-- Também não deve permitir inserir, nos recomendados, conteúdo que o perfil já viu.

create trigger FavoritoNoHistorico
before insert on Favorito
when not exists (
    select * from Historico
    where
        idConteudo=new.idConteudo
        and idPerfil=new.idPerfil
)
begin
    select raise(rollback, 'Um perfil tem que ver um conteúdo para o poder adicionar aos favoritos');
end;

create trigger RecomendadoNaoVisto
before insert on Recomendado
when exists (
    select * from Historico
    where
        idConteudo=new.idConteudo
        and idPerfil=new.idPerfil
)
begin
    select raise(rollback, 'Um perfil não pode ser recomendado de um conteúdo que já viu');
end;
