CREATE TABLE mwib AS
(
    SELECT word, id, sen, idx
    FROM words
	WHERE
		what LIKE 'body'
        AND
        word REGEXP '^([a-zA-Z]+)$'
    GROUP BY word ASC, id ASC, sen ASC, idx ASC
)
;


CREATE INDEX i_idx ON mwib(id);
select m1.id, m2.word, m2.sen, m2.idx
from mwib m1, mwib m2
where
    m1.id = m2.id
    and
    m1.sen = m2.sen
    and
    m1.word ='database';



CREATE INDEX i_idx ON mwib(id);
CREATE INDEX i_idx ON mwi(id);
CREATE INDEX w_idx ON mwib(word);
select mwi.word
from mwi
where
    mwi.word not in
        (
            select mwib.word
            from mwib
            where mwi.id = mwib.id
        )



select mwi.word
from mwi, mwib
where
    mwi.word = mwib.word
    and
    mwi.word like "d%";
