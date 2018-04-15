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
        ) t
    where
        id = postid
    group by id
    order by rank desc limit 15;
end //

delimiter ;
CALL bestmatch3('using','regions','blocks','code','pointer');



drop function if exists SPLIT_STR;
CREATE FUNCTION SPLIT_STR(
    x VARCHAR(255),
    delim VARCHAR(12),
    pos INT
)
RETURNS VARCHAR(255)
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
    LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
    delim, '');

drop procedure if exists bestmatchN;
delimiter //
create procedure bestmatchN (in words varchar(1000))
begin
    SET @query = "select id, sum(score) rank, body from posts, (";

    SET @totalWordCount = (LENGTH(words) - LENGTH(REPLACE(words, ",", ""))) + 1;
    SET @currentWordIndex = 0;

    REPEAT
        SET @currentWordIndex = @currentWordIndex + 1;
        SET @word = SPLIT_STR(words, ",", @currentWordIndex);

        SET @query = concat(@query, "select distinct id, 1 score from wi where word = '");
        SET @query = concat(@query, @word);
        SET @query = concat(@query, "' ");

        IF @currentWordIndex < @totalWordCount
        THEN
            SET @query = concat(@query, "UNION ALL ");
        END IF;

    UNTIL @currentWordIndex >= @totalWordCount
    END REPEAT;

    SET @query = concat(@query, ") t ");
    SET @query = concat(@query, "where id = postid group by id order by rank desc limit 15;");

    SELECT @query;

end //
delimiter ;

CALL bestmatchN("using,regions,blocks");




drop function if exists SPLIT_STR;
CREATE FUNCTION SPLIT_STR(
    x VARCHAR(255),
    delim VARCHAR(12),
    pos INT
)
RETURNS VARCHAR(255)
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
    LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
    delim, '');

drop procedure if exists bestmatchN;
delimiter //
create procedure bestmatchN (in words varchar(1000))
begin
    SET @query = "select id, sum(score) rank, body from posts, (";

    SET @totalWordCount = (LENGTH(words) - LENGTH(REPLACE(words, ",", ""))) + 1;
    SET @currentWordIndex = 0;

    REPEAT
        SET @currentWordIndex = @currentWordIndex + 1;
        SET @word = SPLIT_STR(words, ",", @currentWordIndex);

        SET @query = concat(@query, "select distinct id, 1 score from wi where word = '");
        SET @query = concat(@query, @word);
        SET @query = concat(@query, "' ");

        IF @currentWordIndex < @totalWordCount
        THEN
            SET @query = concat(@query, "UNION ALL ");
        END IF;

    UNTIL @currentWordIndex >= @totalWordCount
    END REPEAT;

    SET @query = concat(@query, ") t ");
    SET @query = concat(@query, "where id = postid group by id order by rank desc limit 15;");

    PREPARE stmt FROM @query;
    EXECUTE stmt;

end //
delimiter ;

CALL bestmatchN("using,regions,blocks");
