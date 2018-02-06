-- Nested query

SELECT role_type.role FROM `role_type`
WHERE role_type.id IN (
    SELECT `role_type_id` FROM `casting`
    INNER JOIN `person`
    ON casting.person_id = person.id
    WHERE
        (person.name LIKE '%Kevin%')
        AND
        (person.name LIKE '%Bacon%')
    GROUP BY casting.role_type_id
)
;

-- INNER JOIN

SELECT DISTINCT role_type.role FROM `role_type`
INNER JOIN `casting`
    ON role_type.id = casting.role_type_id
INNER JOIN `person`
    ON casting.person_id = person.id
WHERE
    person.name LIKE '%Kevin%'
    AND
    person.name LIKE '%Bacon%'
;
