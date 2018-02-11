Execute:
> SELECT movie.title, movie.production_year FROM `movie`
INNER JOIN `kind_type`
ON movie.kind_id = kind_type.id
WHERE
    movie.title LIKE "Pirates of the Caribbean%"
    AND
    kind_type.kind = 'movie'

+ ---------- + -------------------- +
| title      | production_year      |
+ ---------- + -------------------- +
| Pirates of the Caribbean 6 |                      |
| Pirates of the Caribbean: At World's End | 2007                 |
| Pirates of the Caribbean: Dead Man's Chest | 2006                 |
| Pirates of the Caribbean: Dead Men Tell No Tales | 2017                 |
| Pirates of the Caribbean: On Stranger Tides | 2011                 |
| Pirates of the Caribbean: Tales of the Code: Wedlocked | 2011                 |
| Pirates of the Caribbean: The Curse of the Black Pearl | 2003                 |
| Pirates of the Caribbean: The Young Sparrow | 2016                 |
+ ---------- + -------------------- +
8 rows

Execute:
> SELECT COUNT(movie.id) AS 'Count(*)' FROM `movie`
INNER JOIN `kind_type`
    ON kind_type.id = movie.kind_id
WHERE
    movie.production_year = 2004
    AND
    kind_type.kind = 'movie'

+ ------------- +
| Count(*)      |
+ ------------- +
| 14143         |
+ ------------- +
1 rows

Execute:
> SELECT movie.title from `movie`
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

+ ---------- +
| title      |
+ ---------- +
| Quantum of Solace |
+ ---------- +
1 rows

Execute:
> SELECT DISTINCT role_type.role FROM `role_type`
INNER JOIN `casting`
    ON role_type.id = casting.role_type_id
INNER JOIN `person`
    ON casting.person_id = person.id
WHERE
    person.name LIKE '%Kevin%'
    AND
    person.name LIKE '%Bacon%'

+ --------- +
| role      |
+ --------- +
| actor     |
| director  |
| producer  |
| writer    |
| cinematographer |
| editor    |
+ --------- +
6 rows

Execute:
> SELECT role_type.role, COUNT(*) as `number`
FROM `role_type`
INNER JOIN `casting`
    ON casting.role_type_id = role_type.id
GROUP BY casting.role_type_id
ORDER BY `number`  DESC

+ --------- + ----------- +
| role      | number      |
+ --------- + ----------- +
| actor     | 16622527    |
| actress   | 9906721     |
| miscellaneous crew | 6170099     |
| producer  | 5936394     |
| writer    | 3799109     |
| director  | 2353225     |
| editor    | 1599479     |
| cinematographer | 1234113     |
| composer  | 1055730     |
| production designer | 421641      |
| costume designer | 363650      |
+ --------- + ----------- +
11 rows

Execute:
> SELECT movie.title from `movie`
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

+ ---------- +
| title      |
+ ---------- +
| A Good Year |
| Body of Lies |
| Robin Hood |
+ ---------- +
3 rows

Execute:
> SELECT MAX(c) FROM(
    SELECT COUNT(*) as c
    FROM `casting`
    GROUP BY casting.movie_id
) AS Results

+ ----------- +
| MAX(c)      |
+ ----------- +
| 1742        |
+ ----------- +
1 rows

Execute:
> SELECT COUNT(DISTINCT casting.person_id) as `my_count_of_actors`
FROM `casting`
INNER JOIN `role_type`
    ON role_type.id = casting.role_type_id
INNER JOIN `person`
    ON person.id = casting.person_id
WHERE
    casting.movie_id IN (
        SELECT DISTINCT casting.movie_id
        FROM `casting`
        INNER JOIN `person`
            ON person.id = casting.person_id
        INNER JOIN `role_type`
            ON role_type.id = casting.role_type_id
        WHERE
            (
                person.name LIKE '%Kevin%'
                AND
                person.name LIKE '%Bacon%'
            )
            AND
            role_type.role LIKE 'actor'
    )
    AND
    (
        role_type.role LIKE 'actor'
    )
    -- Kevin Bacon has more than one entry, so avoid duplicates on him!
    AND NOT
    (
        person.name LIKE '%Kevin%'
        AND
        person.name LIKE '%Bacon%'
    )

+ ----------------------- +
| my_count_of_actors      |
+ ----------------------- +
| 5721                    |
+ ----------------------- +
1 rows

Execute:
> SELECT movie.title
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

+ ---------- +
| title      |
+ ---------- +
| The Diamond of Doom |
| Ang Panday 2 |
| O'Shaughnessy's Boy |
| The Circus Show-Up |
| The Hugga Bunch |
+ ---------- +
5 rows

Execute:
> SELECT movie.title, movie.production_year
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

+ ---------- + -------------------- +
| title      | production_year      |
+ ---------- + -------------------- +
| Choke      | 2008                 |
| Dreamgirls | 2006                 |
| Hotelliggaren | 2005                 |
| Hustle & Flow | 2005                 |
| Madagascar | 2005                 |
| Over the Hedge | 2006                 |
| Stardust   | 2007                 |
+ ---------- + -------------------- +
7 rows

Execute:
> SELECT movie.title
FROM `movie`
INNER JOIN `casting`
    ON casting.movie_id = movie.id
INNER JOIN `role`
    ON role.id = casting.role_id
WHERE
    role.name LIKE 'The Singing Kid'

+ ---------- +
| title      |
+ ---------- +
| Broken     |
+ ---------- +
1 rows

Execute:
> SELECT person.name, movie.title
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

+ --------- + ---------- +
| name      | title      |
+ --------- + ---------- +
| Baxter, Daniel | How the Desolation of Smaug Should Have Ended |
| Freeman, Martin | The Hobbit: The Desolation of Smaug |
+ --------- + ---------- +
2 rows
