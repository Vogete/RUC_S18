drop table if exists wi;
create table wi as
    select id, word, Count(word)
    from words
    where
        word regexp '^[A-Za-z][A-Za-z0-9_]{1,}$'
        and
        tablename = 'posts'
        and
        (
            what='title'
            or
            what='body'
        )
    group by id,word
;




drop table if exists wi2;
create table wi2 as
    select id, word, Count(word)
    from words
    where
        word regexp '^[A-Za-z][A-Za-z0-9_]{1,}$'
        and
        tablename = 'posts'
        and
        (
            what='title'
            or
            what='body'
        )
        AND
        word NOT IN
            (
                SELECT word
                FROM stopwords
                WHERE
                    stopwords.word = words.word
            )
    group by id, word
;



drop table if exists li;
create table li as
    select id, lemma, Count(lemma)
    from words
    where
        lemma regexp '^[A-Za-z][A-Za-z0-9_]{1,}$'
        and
        tablename = 'posts'
        and
        (
            what='title'
            or
            what='body'
        )
        AND
        lemma NOT IN
            (
                SELECT word
                FROM stopwords
                WHERE
                    stopwords.word = words.lemma
            )
    group by id, lemma
;
