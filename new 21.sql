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

SELECT Tracks AS t
FROM name AS n
LEFT JOIN Collections_Tracks AS c ON c.track_id = t.id
WHERE c.track_id IS NULL

	
--8. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько

SELECT name
FROM Executor
JOIN Executor_Albums AS aa ON art.id = aa.artist_id 
JOIN albums AS alb ON aa.albums_id  = alb.id
JOIN track AS t ON alb.id = t.albums_id 
WHERE lenght = (SELECT MIN(lenght) FROM track);

--9. названия альбомов, содержащих наименьшее количество треков

select name from Albums as a
left join Tracks as t on t.track_id = a.albums_id
where t.albums_id in (
    select t.albums_id from Tracks
    group by  t.albums_id
    having count( t.albums_id) = (
         select count(track_id)
         from Tracks
         group by albums_id
         order by count
         limit 1