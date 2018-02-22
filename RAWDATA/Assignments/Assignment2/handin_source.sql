USE ztf;

-- -----------------------------------------------------------------------------
-- ---------------
-- Question A
-- ---------------
-- -----------------------------------------------------------------------------

DROP FUNCTION IF EXISTS movie_count;

DELIMITER //

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

DELIMITER ;

-- ---------------
-- Call function:
-- ---------------

SELECT movie_count('Bacon, Kevin');


-- -----------------------------------------------------------------------------
-- ---------------
-- Question B
-- ---------------
-- -----------------------------------------------------------------------------

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


-- -----------------------------------------------------------------------------
-- ---------------
-- Question C
-- ---------------
-- -----------------------------------------------------------------------------

DROP procedure IF exists recent_movies;

DELIMITER //

CREATE PROCEDURE recent_movies ( text_input varchar(64) )
BEGIN

    SELECT m.title
        FROM imdb_movie.movie m
        WHERE
            m.title like CONCAT('%',text_input,'%')
            AND
            m.kind_id = 1
        ORDER BY m.production_year DESC
        LIMIT 10;

END //

DELIMITER ;

-- ---------------
-- Call procedure:
-- ---------------

CALL recent_movies('one');

-- -----------------------------------------------------------------------------
-- ---------------
-- Question D
-- ---------------
-- -----------------------------------------------------------------------------

DROP FUNCTION IF EXISTS roles;

DELIMITER //

CREATE FUNCTION roles (actor_name varchar(64)) RETURNS varchar(2048)
BEGIN

	DECLARE actor_roles varchar(2048);

    SELECT GROUP_CONCAT(DISTINCT role SEPARATOR ', ')
        INTO actor_roles
        FROM imdb_movie.casting
        JOIN imdb_movie.person
            ON person_id = person.id
        JOIN imdb_movie.role_type
            ON role_type_id = role_type.id
        WHERE
            name like actor_name;


    RETURN COALESCE(actor_roles, 'Error');

END //

DELIMITER ;


-- ---------------
-- Call function:
-- ---------------

SELECT roles('Bacon, Kevin');

SELECT name, roles(name)
    FROM imdb_movie.person
    WHERE name LIKE 'De Niro, R%';
