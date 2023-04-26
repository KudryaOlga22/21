SELECT name, year  FROM Albums
		WHERE year = 2018;

SELECT name, duration FROM Tracks
		ORDER BY duration DESC
		LIMIT 1;

SELECT name FROM Tracks
		WHERE duration > 210;
	
SELECT name FROM Collections
		WHERE year_ BETWEEN 2018 AND 2020;	
	
SELECT name FROM Executor
		WHERE name NOT LIKE '%% %%';
		
SELECT name FROM Tracks
		WHERE name LIKE '%%My%%';