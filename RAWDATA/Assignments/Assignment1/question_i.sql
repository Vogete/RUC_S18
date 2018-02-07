SELECT movie.title
FROM `movie`
INNER JOIN `movie_keyword`
    ON movie_keyword.movie_id = movie.id
INNER JOIN `keyword`
    ON keyword.id = movie_keyword.keyword_id
WHERE
(
    keyword.keyword LIKE 'sister'
    OR
    keyword.keyword LIKE 'elephant'
)
GROUP BY
    movie.id
HAVING
    COUNT(movie.id)>=2
;
