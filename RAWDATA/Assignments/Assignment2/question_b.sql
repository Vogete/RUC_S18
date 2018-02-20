DROP procedure IF exists movies;

DELIMITER //

CREATE PROCEDURE movies ( actor_name varchar(64) )
BEGIN
    SELECT distinct m.title
        FROM imdb_movie.casting c, imdb_movie.person p, imdb_movie.movie m
        WHERE
            (
            c.person_id = p.id
            AND c.movie_id = m.id
            AND m.kind_id = 1
            AND c.role_type_id = 1
            )
            AND
            p.name like actor_name;
END //

DELIMITER ;


-- ---------------
-- Call procedure:
-- ---------------

CALL movies('Mikkelsen, Mads');
