SELECT person.name, movie.title
FROM `movie`
INNER JOIN `casting`
    ON casting.movie_id = movie.id
INNER JOIN `person`
    ON person.id = casting.person_id
INNER JOIN `role`
    ON role.id = casting.role_id
WHERE
    movie.title LIKE '%Smaug%'
    AND
    role.name LIKE 'Bilbo'
;
