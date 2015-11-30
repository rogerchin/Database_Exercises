USE codeup_test_db;

TRUNCATE albums;

INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Michael Jackson', 'Thriller', 1982, 68, 'Pop, Rock, RnB'),
('AC/DC', 'Back In Black', 1980, 36, 'Rock'),
('Pink Floyd', 'The Dark Side Of The Moon', 1973, 44, 'Progressive Rock'),
('The Beatles', 'Sgt. Pepper''s Lonely Hearts Club Band', 1967, 32, 'Rock'),
('Nirvana', 'Nevermind', 1991, 26, 'Grunge, alternative rock');

