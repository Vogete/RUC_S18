DELIMITER //

DROP FUNCTION IF EXISTS movie_count //

CREATE FUNCTION movie_count (actor_name varchar(64)) RETURNS INT
BEGIN

	DECLARE actor_movies INT;

    SELECT count(distinct movie_id)
    INTO actor_movies
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

    RETURN COALESCE(actor_movies, 'Error');

END //
