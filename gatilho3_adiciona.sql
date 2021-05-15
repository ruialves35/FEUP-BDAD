-- Para ajudar o utilizador da base de dados, quando ele tenta inserir um tuplo com chave primária repetida numa das tabelas relacionadas com qualidade 
-- (ConteudoEspecialQualidade, FilmeQualidade ou EpisodioQualidade), em vez de inserir esse tuplo e lançar o erro default, vamos atualizar o tuplo
-- antigo com a nova informação (neste caso, o videoURL). Isto é útil para o utilizador poder inserir novos vídeos do seu conteúdo sem necessitar
-- de pensar se já inseriu um com essa resolução

create trigger FilmeQualidadeRepetido
before insert on FilmeQualidade
when exists (
    select * from FilmeQualidade
    where idFilme=new.idFilme and resolucao=new.resolucao
)
begin
    delete from FilmeQualidade
    where idFilme=new.idFilme and resolucao=new.resolucao;
end;

create trigger ConteudoEspecialQualidadeRepetido
before insert on ConteudoEspecialQualidade
when exists (
    select * from ConteudoEspecialQualidade
    where idConteudo=new.idConteudo and resolucao=new.resolucao
)
begin
    delete from ConteudoEspecialQualidade
    where idConteudo=new.idConteudo and resolucao=new.resolucao;
end;

create trigger EpisodioQualidadeRepetido
before insert on EpisodioQualidade
when exists (
    select * from EpisodioQualidade
    where idEpisodio=new.idEpisodio and resolucao=new.resolucao
)
begin
    delete from EpisodioQualidade
    where idEpisodio=new.idEpisodio and resolucao=new.resolucao;
end;