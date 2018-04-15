drop procedure if exists bestmatch3;
delimiter //
create procedure bestmatch3 (
                                in w1 varchar(100),
                                in w2 varchar(100),
                                in w3 varchar(100)
                            )
begin
    select id, sum(score) rank, body
    from posts,
        (
            select distinct id, 1 score
            from wi
            where
                word = w1
            union all
            select distinct id, 1 score
            from wi
            where
                word = w2
            union all
            select distinct id, 1 score
            from wi
            where
                word = w3
        ) t
    where
        id = postid
    group by id
    order by rank desc limit 15;
end //
delimiter ;
CALL bestmatch3('using','regions','blocks');



drop procedure if exists bestmatch3;
delimiter //
create procedure bestmatch3 (
                                in w1 varchar(100),
                                in w2 varchar(100),
                                in w3 varchar(100),
                                in w4 varchar(100),
                                in w5 varchar(100)
                            )
begin
    select id, sum(score) rank, body
    from posts,
        (
            select distinct id, 1 score
            from wi
            where
                word = w1
            union all
            select distinct id, 1 score
            from wi
            where
                word = w2
            union all
            select distinct id, 1 score
            from wi
            where
                word = w3
            union all
            select distinct id, 1 score
            from wi
            where
                word = w4
            union all
            select distinct id, 1 score
            from wi
            where
                word = w5
        ) t
    where
        id = postid
    group by id
    order by rank desc limit 15;
end //

delimiter ;
CALL bestmatch3('using','regions','blocks','code','pointer');
