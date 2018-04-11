drop table if exists wi;
create table wi as
select id,word from words 
where word regexp '^[A-Za-z][A-Za-z0-9_]{1,}$' 
and tablename = 'posts' and (what='title' or what='body')
group by id,word;


drop procedure if exists bestmatch3;
delimiter //
create procedure bestmatch3
	(in w1 varchar(100),in w2 varchar(100),in w3 varchar(100))
begin
  select id, sum(score) rank, body from posts,
    (select distinct id, 1 score from wi where word = w1
    union all
    select distinct id, 1 score from wi where word = w2
    union all
    select distinct id, 1 score from wi where word = w3) t 
  where id=postid group by id order by rank desc limit 15;
end //
delimiter ;
CALL bestmatch3('using','regions','blocks');


drop procedure if exists rewrite;
delimiter //
CREATE PROCEDURE rewrite(param VARCHAR(1000))
BEGIN
  /* Rewrites a comma-separated 'n-argument' input string parameter and 
     compose a new dummy string as output with a new substrings in 
     replacement for the beginning, every "in-between" (comma) and the end.
     Can be modified such that a dynamic SQL expression, taking any number 
     of words as input, is composed and the result from excuting this is provided*/
  SET @s = 'BEGINNING-';
  SET @s = concat(@s,replace(param,',','-INBETWEEN-'));
  SET @s = concat(@s,'-THEEND');
  SELECT @s;
end //
delimiter ;
CALL rewrite('one,two,three,four');


drop procedure if exists find;
delimiter //
create procedure find(w1 varchar(100), w2 varchar(100))
begin
  SET @s="select body from posts where postid in (select id from words where word = '";
  SET @s=concat(@s,w1);
  SET @s=concat(@s,"') and postid in (select id from words where word = '");
  SET @s=concat(@s,w2);
  SET @s=concat(@s,"');");
  PREPARE stmt FROM @s;
  EXECUTE stmt;
end //
delimiter ;
CALL find('sql','injection');