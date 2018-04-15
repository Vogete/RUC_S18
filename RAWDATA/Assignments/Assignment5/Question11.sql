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
            select distinct wi_post.postid, wi_post.wiid, wi_post.score
            from wi_post
            inner join wi
                on wi.wiid = wi_post.wiid
            where
                wi.word = w1
            union all
            select distinct wi_post.postid, wi_post.wiid, wi_post.score
            from wi_post
            inner join wi
                on wi.wiid = wi_post.wiid
            where
                wi.word = w2
            union all
            select distinct wi_post.postid, wi_post.wiid, wi_post.score
            from wi_post
            inner join wi
                on wi.wiid = wi_post.wiid
            where
                wi.word = w3
        ) t
    where
        id = postid
    group by id
    order by rank desc limit 15;
end //
delimiter ;
CALL bestmatch3('using','regions','blocks');
