SELECT movie.title from `movie`
INNER JOIN `casting`
    ON casting.movie_id = movie.id
INNER JOIN `person`
    ON person.id = casting.person_id
INNER JOIN `role_type`
    ON role_type.id = casting.role_type_id
WHERE
    (
        movie.production_year = 2004
        OR
        movie.production_year = 2006
        OR
        movie.production_year = 2008
        OR
        movie.production_year = 2010
    )
    AND
    (
        person.name LIKE '%Ridley%'
        AND
        person.name LIKE '%Scott%'
    )
    AND
    (
        role_type.role = 'director'
    )
;
