-- Solution 1
SELECT COUNT(*) as c
FROM `casting`
GROUP BY casting.movie_id
ORDER BY c DESC
LIMIT 1
;

-- Solution 2
SELECT MAX(c) FROM(
    SELECT COUNT(*) as c
    FROM `casting`
    GROUP BY casting.movie_id
) AS Results
;
