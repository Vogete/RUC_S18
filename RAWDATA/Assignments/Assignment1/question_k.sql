SELECT movie.title
FROM `movie`
INNER JOIN `casting`
    ON casting.movie_id = movie.id
INNER JOIN `role`
    ON role.id = casting.role_id
WHERE
    role.name LIKE 'The Singing Kid'
;
