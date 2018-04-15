SELECT DISTINCT word, pos, lemma
    FROM words
    GROUP BY word, pos, lemma
    ;

SELECT DISTINCT word, pos
    FROM words
    GROUP BY word, pos
;

SELECT *
    FROM words w1, words w2
    WHERE
        w1.word = w2.word
        AND
        w1.pos = w2.pos
        AND NOT
        w1.lemma = w2.lemma
;
