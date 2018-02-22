Execute:
> -- ---------------
-- Call function:
-- ---------------

SELECT movie_count('Bacon, Kevin')

+ -------------------------------- +
| movie_count('Bacon, Kevin')      |
+ -------------------------------- +
| 90                               |
+ -------------------------------- +
1 rows

Execute:
> -- ---------------
-- Call procedure:
-- ---------------

CALL movies('Mikkelsen, Mads')

+ ---------- +
| title      |
+ ---------- +
| A Bond for Life: How James Bond Changed My Life |
| Adams æbler |
| Bleeder    |
| Blinkende lygter |
| Blomsterfangen |
| Café Hector |
| Casino Royale |
| Clash of the Titans |
| Coco Chanel & Igor Stravinsky |
| De grønne slagtere |
| Die Tür   |
| Doctor Strange |
| Dykkerdrengen |
| Efter brylluppet |
| Elsker dig for evigt |
| En kongelig affære |
| En kort en lang |
| Exit       |
| Flammen & Citronen |
| I Am Dina  |
| Jagten     |
| King Arthur |
| Michael Kohlhaas |
| Monas verden |
| Move On    |
| Muumi ja punainen pyrstötähti |
| Mænd & høns |
| Nattens engel |
| Nu         |
| Prag       |
| Pusher     |
| Pusher II  |
| Rogue One: A Star Wars Story |
| The Necessary Death of Charlie Countryman |
| The Salvation |
| The Three Musketeers |
| Tom Merritt |
| Torremolinos 73 |
| Valhalla Rising |
| Vildspor   |
| Wilbur Wants to Kill Himself |
+ ---------- +
41 rows

Execute:
> -- ---------------
-- Call procedure:
-- ---------------

CALL recent_movies('one')

+ ---------- +
| title      |
+ ---------- +
| DiaDione   |
| Red Stone  |
| Fastlane Warzone |
| One Patient |
| One in a Billion |
| Gone Human |
| Sword in the Stone |
| Mysterious One |
| The Zone   |
| Brownstone |
+ ---------- +
10 rows

Execute:
> -- ---------------
-- Call function:
-- ---------------

SELECT roles('Bacon, Kevin')

+ -------------------------- +
| roles('Bacon, Kevin')      |
+ -------------------------- +
| actor, cinematographer, director, editor, producer, writer |
+ -------------------------- +
1 rows

Execute:
> SELECT name, roles(name)
    FROM imdb_movie.person
    WHERE name LIKE 'De Niro, R%'

+ --------- + ---------------- +
| name      | roles(name)      |
+ --------- + ---------------- +
| De Niro, Raphael | actor, producer  |
| De Niro, Robert | actor, director, producer |
| De Niro, Rocco | actor            |
| de Niro, Ryan | cinematographer  |
+ --------- + ---------------- +
4 rows
