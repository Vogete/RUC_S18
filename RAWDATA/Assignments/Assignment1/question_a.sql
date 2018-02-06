-- With nested query

SELECT movie.title, movie.production_year FROM `movie`
WHERE
    movie.title LIKE 'Pirates of the Caribbean%'
    AND
    kind_id = (
        SELECT kind_type.id FROM `kind_type`
        WHERE
        kind_type.kind = 'movie'
    )
;


-- With Inner Join

SELECT movie.title, movie.production_year FROM `movie`
INNER JOIN `kind_type`
ON movie.kind_id = kind_type.id
WHERE
    movie.title LIKE "Pirates of the Caribbean%"
    AND
    kind_type.kind = 'movie'
;
