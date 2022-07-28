insert into artists (name)
	values ('Боб Дилан'),
	('The Rolling Stones'),
	('Джон Леннон'),
	('Марвин Гэй'),
	('Арета Франклин'),
	('The Beach Boys'),
	('Чак Берри'),
	('	The Beatles');

insert into albums (name, year)
	values ('Highway 61 Revisited', 1965),
	('Out of Our Heads', 1965),
	('Imagine', 1971),
	('What’s Going On', 1971),
	('I Never Loved a Man the Way I Love You', 1967),
	('Smiley Smile', 1966),
	('Chuck Berry Is on Top', 1958),
	('The Beatles', 1968);
	
insert into genre (name)
	values ('Техно'),
	('Классическая музыка'),
	('Джаз'),
	('Поп'),
	('Рэп');

insert into track_list (name, duration, album_id)
	values('Like a Rolling Stone', 373, 1),
	('(I Can’t Get No) Satisfaction', 224, 2),
	('Imagine', 181, 3),
	('What’s Going On ', 220, 4),
	('Respect', 149, 5),
	('Good Vibrations', 219, 6),
	('Johnny B. Goode', 160, 7),
	('Hey Jude', 428, 8),
	('Tombstone Blues', 420, 1),
	('It Takes a Lot to Laugh', 250, 1),
	('The Last Time', 221, 2),
	('Play with Fire', 133, 2),
	('Crippled Inside', 227, 3),
	('Jealous Guy', 256, 3),
	('What’s Happening Brother', 163, 4);

insert into mix (name, year)
	values ('first', 1970),
	('second', 1975),
	('third', 1980),
	('fourth', 1985),
	('fifth', 1990),
	('sixth', 1995),
	('seventh', 1980),
	('eighth', 1975);
	
insert into ArtistGenre (artist_id, genre_id )
	values (1, 1),
	(2, 4),
	(3, 5),
	(4, 2),
	(5, 3),
	(6, 3),
	(7, 1),
	(8, 5);
	
insert into mix_tracks (mix_id, track_list_id)
	values (1, 1),
	 (8, 15),
	  (7, 14),
	   (6, 13),
	    (5, 12),
	     (4, 11),
	      (3, 10),
	       (2, 9),
	        (1, 8),
	         (3, 7),
	          (5, 6),
	           (7, 5),
	            (8, 4),
	             (6, 3),
	              (5, 2);
	             
insert into artistalbum (artist_id, album_id)
	values (1, 1),
	 (2, 2),
	  (3, 3),
	   (4, 4),
	    (5, 5),
	     (6, 6),
	      (7, 7),
	       (8, 8);

insert into ArtistGenre (artist_id, genre_id )
	values (1, 5)
	
insert into ArtistGenre (artist_id, genre_id )
	values (2, 3)

insert into artists (name)
	values ('Sting');

insert into albums (name, year)
	values ('The Last Ship', 2013);

insert into track_list (name, duration, album_id)
	values('Dead Mans Boots', 200, 9);
insert into ArtistGenre (artist_id, genre_id )
	values (9, 4);
insert into artistalbum (artist_id, album_id)
	values (9, 9)
	
	
