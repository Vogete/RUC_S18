SELECT COUNT(DISTINCT casting.person_id) as `my_count_of_actors`
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
;
