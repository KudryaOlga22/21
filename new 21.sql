--1. количество исполнителей в каждом жанре;

SELECT g.genre,
COUNT(e.executor_id) count_executor 
FROM Genres g
LEFT JOIN genre of music_Executor e ON g.id = e.genre_id
GROUP BY g.genre;

--2. количество треков, вошедших в альбомы 2019-2020 годов;

SELECT COUNT(t.id) count_2019_2020 
FROM Tracks t
RIGHT JOIN Albums a ON t.album_id = a.id
WHERE year BETWEEN 2019 AND 2020;

--3. средняя продолжительность треков по каждому альбому;

SELECT a.name album, AVG(t.duration) avg_duration FROM Tracks t
RIGHT JOIN Albums a ON t.album_id = a.id
GROUP BY a.name;

--4. все исполнители, которые не выпустили альбомы в 2020 году;

SELECT name FROM executor
WHERE name NOT IN (
	SELECT p.name FROM executor e
	LEFT JOIN Executor_Albums ea ON e.id = ea.executor_id
	LEFT JOIN Albums a ON ea.album_id = a.id
	WHERE year_ = 2020
	);
	
--5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами);

SELECT DISTINCT c.name collections_with_Rihanna FROM Collections c 
JOIN Collections_Tracks ct ON c.id = ct.collection_id
JOIN Tracks t ON ct.track_id = t.id
JOIN Albums a ON t.album_id = a.id
JOIN Executor_Albums ea ON a.id = ea.album_id
JOIN Executor e ON ea.Executor_id = e.id
WHERE e.name iLIKE '%%Rihanna%%';

--6. название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT DISTINCT a.name FROM Albums a 
JOIN Executor_Albums pa ON a.id = pa.album_id
WHERE ea.Executor_id IN (
	SELECT Executor_id FROM (
		SELECT ge.Executor_id, COUNT(gp.genre_id) FROM Genre_Executor ge
		GROUP BY ge.Executor_id
		HAVING COUNT(ge.genre_id)>1
		) Subtable1
	);
	
--7. наименование треков, которые не входят в сборники;

SELECT name FROM Tracks
WHERE id NOT IN (
	SELECT DISTINCT track_id FROM Collections_Tracks); 
	
--8. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько

SELECT DISTINCT name FROM Executor
JOIN Executor_Albums ea ON e.id = ea.Executor_id
WHERE album_id IN (
	SELECT album_id FROM Tracks
	WHERE duration = (
		SELECT MIN(duration) FROM Tracks
		)
	);
	
--9. названия альбомов, содержащих наименьшее количество треков

DROP TABLE IF EXISTS table1;
SELECT a.name, COUNT(t.id) amount INTO table1 FROM Albums a
JOIN Tracks t ON a.id = t.album_id
GROUP BY a.name; 

--создание временной таблицы
SELECT * FROM table1
WHERE amount = (
	SELECT MIN(amount) FROM table1
	);