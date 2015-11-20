USE codeup_test_db;

SELECT 'Albums By: ' AS 'Pink Floyd';
SELECT name FROM albums WHERE artist = 'Pink Floyd';

SELECT 'Year Of: ' As 'Sgt. Pepper''s Lonely Hearts Club';
SELECT release_date FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club';

SELECT 'Genre for: ' As 'Nevermind';
SELECT genre FROM albums WHERE name = 'Nevermind';

SELECT 'Albums released after: ' As '1990';
SELECT * FROM albums WHERE release_date BETWEEN 1990 AND 2000;

SELECT 'Albums with less than: ' AS '20 million sales';
SELECT * FROM albums WHERE sales <= 20;

SELECT 'Albums with the Genre: ' AS 'Rock';
SELECT * FROM albums WHERE genre = '%rock%';