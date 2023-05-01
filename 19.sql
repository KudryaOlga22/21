INSERT INTO Executor (name)
	VALUES  ('Rihanna'),
			('Lady Gaga'),
			('Paramore'),
			('Linkin Park'),
			('Jay-Z'),
			('Louis Armstrong'),
			('Björk'),
			('The Prodigy');
			
	INSERT INTO genre_of_music (name)
	VALUES  ('Pop'),
			('Rock'),
			('Hip Hop'),
			('Electronic'),
			('jazz');
			
INSERT INTO	genre_of_music_Executor
	VALUES  (1,1),
			(1,2),
			(2,3),
			(2,4),
			(3,5),
			(4,6),
			(4,7),
			(5,8);
			
INSERT INTO Albums(name, year)
	VALUES  ('Anti', 2016),
			('Chromatica', 2020),
			('This Is Why', 2023),
			('One More Light', 2017),
			('Tip Of The ICEberg', 2022),
			('What A Wonderful World', 1967),
			('Utopia', 2017),
			('Lost Beats', 2009);
			
INSERT INTO	Executor_Albums
	VALUES  (1,1),
			(2,2),
			(3,3),
			(4,4),
			(5,5),
			(6,6),
			(7,7),
			(8,8);

INSERT INTO Tracks(id, name, track_duration, albums_id)
	VALUES  (1, 'Consideration (feat. SZA)', 241, 2),
			(2, 'Kiss It Better', 413, 1),
			(3, 'Desperado', 306, 4),
			(4, 'Alice', 257, 3),
			(5, 'Stupid Love»', 259, 4),
			(6, 'Rain On Me', 302, 4),
			(7, 'This Is Why', 327, 4),
			(8, 'The News', 307, 5),
			(9, 'Nobody Can Save Me', 344, 6),
			(10, 'Good Goodbye', 331, 6),
			(11, 'Friends', 248, 6),
			(12, 'Cabaret', 246, 6),
			(13, 'Hello Brother', 331, 7),
			(14, 'Blissing Me', 505, 7),
			(15, 'The Gate', 633, 7),
			(16, 'Sleepy', 118, 8);
			
INSERT INTO Collections(name, year)
	VALUES  ('2020x', 2021),
			('Luchshiye pechi 2020', 2020),
			('hot 20', 2018),
			('Best', 2011),
			('Winter compilation', 2010),
			('New', 2020),
			('Twin', 2018),
			('jazz1', 2012);
			
INSERT INTO	tracks_collections
	VALUES  (1,1),
			(2,2),
			(4,3),
			(6,4),
			(3,5),
			(6,6),
			(7,7),
			(5,8),
			(2,9),
			(7,10),
			(3,11),
			(4,12),
			(1,13),
			(6,14),
			(7,16),
			(8,15);	
	
	

	