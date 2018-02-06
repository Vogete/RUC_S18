SELECT COUNT(movie.id) AS 'Count(*)' FROM `movie`
WHERE
    movie.production_year = 2004
    AND
    kind_id = (
        SELECT kind_type.id FROM `kind_type`
        WHERE
        kind_type.kind = 'movie'
    )
;
