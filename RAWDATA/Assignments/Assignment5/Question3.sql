SELECT DISTINCT id
    FROM words
    WHERE
        word LIKE 'millisecond'
        AND
        tablename LIKE 'posts'
;


SELECT DISTINCT id
    FROM words
    WHERE
        word LIKE 'instrumentation'
        AND
        tablename LIKE 'posts'
;


SELECT * FROM (
    (
        SELECT DISTINCT id
            FROM words as M
            WHERE
                word LIKE 'millisecond'
                AND
                tablename LIKE 'posts'
    )
    Union All
    (
        SELECT DISTINCT id
            FROM words as I
            WHERE
                word LIKE 'instrumentation'
                AND
                tablename LIKE 'posts'
    )
) as U
GROUP BY id HAVING Count(*) = 2
;
