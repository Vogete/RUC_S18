SELECT role_type.role, COUNT(*) as `number`
FROM `role_type`
INNER JOIN `casting`
    ON casting.role_type_id = role_type.id
GROUP BY casting.role_type_id
ORDER BY `number`  DESC
;
