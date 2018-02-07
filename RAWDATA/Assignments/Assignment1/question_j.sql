SELECT movie.title, movie.production_year
FROM `movie`
INNER JOIN `movie_company`
    ON movie.id = movie_company.movie_id
INNER JOIN `company`
    ON company.id = movie_company.company_id
WHERE
    company.name LIKE 'Paramount'
    AND
    company.country_code LIKE '[SE]'
    AND
    movie.production_year > 2004
ORDER BY movie.title ASC
;
