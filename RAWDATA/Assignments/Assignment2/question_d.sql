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

SELECT DISTINCT name, roles(name)
    FROM imdb_movie.person
    WHERE name LIKE 'De Niro, R%';
