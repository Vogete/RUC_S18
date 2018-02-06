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
