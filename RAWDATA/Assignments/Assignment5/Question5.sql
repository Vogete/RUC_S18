CREATE TABLE mwi AS
(
    SELECT word, id, idx
    FROM words
	WHERE
		what LIKE 'title'
        AND
        word REGEXP '^([a-zA-Z]+)$'
    GROUP BY word ASC, id ASC, idx ASC
)
;


SELECT DISTINCT word
FROM mwi
    WHERE word LIKE 'data%'
;


SELECT DISTINCT m2.word
FROM mwi m1, mwi m2
WHERE
    m1.id = m2.id
    AND
    m1.word LIKE 'database'
    AND NOT
    m2.word LIKE 'database'
;


SELECT DISTINCT m2.word
FROM mwi m1, mwi m2
WHERE
    m1.id = m2.id
    AND
    m1.word LIKE 'database'
    AND
    m2.idx > m1.idx
;


SELECT DISTINCT m2.word
FROM mwi m1, mwi m2
WHERE
    m1.id = m2.id
    AND
    m1.word LIKE 'database'
    AND
    m2.idx = m1.idx + 1
;


SELECT DISTINCT m2.word
FROM mwi m1, mwi m2
WHERE
    m1.id = m2.id
    AND
    m1.word LIKE 'database'
    AND
    m2.idx <= m1.idx + 3
    AND
    m2.idx >= m1.idx - 3
    AND NOT
    m2.idx = m1.idx
;


SELECT GROUP_CONCAT(words.word SEPARATOR ' ') as Title FROM words
WHERE
    words.id IN
    (
        SELECT m1.id
        FROM mwi m1, mwi m2
        WHERE
            m1.id = m2.id
            AND
            m2.idx = m1.idx + 1
            AND
            m1.word LIKE 'database'
            AND
            m2.word LIKE 'file'
    )
    AND
    words.what LIKE 'title'
ORDER BY words.idx
;
