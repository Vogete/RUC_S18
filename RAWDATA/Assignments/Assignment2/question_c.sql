DELIMITER //

DROP procedure IF exists recent_movies //

CREATE PROCEDURE recent_movies ( text_input varchar(64) )
BEGIN

    SELECT distinct m.title
    FROM imdb_movie.movie m
    WHERE
        m.title like CONCAT('%',text_input,'%')
        AND
        m.kind_id = 1
    ORDER BY m.production_year DESC
    LIMIT 10;

END //
