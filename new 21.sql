--1. количество исполнителей в каждом жанре;
SELECT gom."name",
COUNT(e2.id) count_executor 
FROM genre_of_music gom 
LEFT JOIN executor e2 ON gom.id = e2.id
GROUP BY gom."name" ;

--2. количество треков, вошедших в альбомы 2019-2020 годов;

SELECT COUNT(t.id) count_2019_2020 
FROM Tracks t
RIGHT JOIN Albums a ON t.albums_id = a.id
WHERE year BETWEEN 2019 AND 2020;

--3. средняя продолжительность треков по каждому альбому;

SELECT a.name album, AVG(track_duration) avg_duration FROM Tracks t
RIGHT JOIN Albums a ON t.albums_id = a.id
GROUP BY a.name;


--4. все исполнители, которые не выпустили альбомы в 2020 году;

SELECT name FROM executor
WHERE name NOT IN (
	SELECT e.name FROM executor e
	LEFT JOIN Executor_Albums ea ON e.id = ea.executor_id
	LEFT JOIN Albums a ON ea.albums_id = a.id
	WHERE a.year = 2020
	);


--5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами);

SELECT DISTINCT c.name collections_with_Rihanna FROM Collections c 
JOIN Tracks_Collections tc ON c.id = tc.collections_id
JOIN Tracks t ON tc.tracks_id = t.id
JOIN Albums a ON t.albums_id = a.id
JOIN Executor_Albums ea ON a.id = ea.albums_id
JOIN Executor e ON ea.Executor_id = e.id
WHERE e.name iLIKE '%%Rihanna%%';

--6. название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT DISTINCT a.name FROM albums a 
JOIN Executor_Albums ea ON a.id = ea.albums_id 
WHERE ea.executor_id  IN (
	SELECT executor_id FROM (
		SELECT ge.Executor_id, COUNT(ge.genre_id) FROM genre_of_music_executor ge
		GROUP BY ge.Executor_id
		HAVING COUNT(ge.genre_id)>1
		) Subtable1
	);

--7. наименование треков, которые не входят в сборники;

SELECT name AS n
FROM Tracks AS t
LEFT JOIN Tracks_Collections AS tc ON tc.tracks_id = t.id
WHERE tc.tracks_id IS null

--8. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько

SELECT e.name, t.track_duration 
FROM executor e 
JOIN executor_albums ea ON ea.executor_id = e.id  
JOIN albums a ON a.id  = ea.albums_id 
JOIN tracks t on t.albums_id = a.id  
where t.track_duration in 
	(SELECT MIN(t2.track_duration) FROM tracks t2);

--9. названия альбомов, содержащих наименьшее количество треков

select a.name
from Albums a
left join tracks t on t.albums_id  = a.id 
where t.albums_id in (
    select t2.albums_id from tracks t2  
    group by  t2.albums_id
    having count( t2.albums_id) = (
         select count(t3.id)
         from Tracks t3
         group by t3.albums_id
         order by count
         limit 1))


