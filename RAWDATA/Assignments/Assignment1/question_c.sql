-- Nested query

SELECT movie.title FROM `movie`
WHERE movie.id IN (
    -- search all the entries Mads Mikkelsen is present in
    SELECT casting.movie_id FROM `casting`
    WHERE casting.person_id = (
        -- get Mads Mikkelsen's ID
        SELECT person.id FROM `person`
        WHERE
            (person.name LIKE '%Mads%')
            AND
            (person.name LIKE '%Mikkelsen%')
    )
)
AND
-- filter only video games
movie.kind_id = (
    SELECT kind_type.id FROM `kind_type`
    WHERE
    kind_type.kind = 'video game'
)
;


-- with INNER JOIN

SELECT movie.title from `movie`
INNER JOIN `casting`
    ON movie.id = casting.movie_id
INNER JOIN `person`
    ON person.id = casting.person_id
INNER JOIN `kind_type`
    ON movie.kind_id = kind_type.id
WHERE
    person.name LIKE '%Mads%'
    AND
    person.name LIKE '%Mikkelsen%'
    AND
    kind_type.kind = 'video game'
;
