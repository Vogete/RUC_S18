SELECT DISTINCT word, pos, lemma
    FROM words
    GROUP BY word, pos, lemma
    ;

SELECT DISTINCT word, pos
    FROM words
    GROUP BY word, pos
;
