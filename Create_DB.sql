create table if not exists artists(
	id serial primary key ,
	name varchar(100) not null 
);

create table if not exists albums(
	id serial primary key,
	name varchar(60) not null,
	year integer check(year >= 0)
);

create table if not exists genre(
	id serial primary key,
	name varchar(60) not null
);
CREATE TABLE IF NOT EXISTS track_list(
	id SERIAL primary key,
	name varchar(40),
	duration INTEGER,
	album_id INTEGER references albums(id)
);
create table if not exists mix(
	id serial primary key,
	name varchar(60) not null,
	year integer check(year >= 0)
);
create table if not exists ArtistAlbum(
	artist_id integer references artists(id),
	album_id integer references albums(id),
	constraint art_alb primary key(artist_id, album_id)	
);
create table if not exists ArtistGenre(
	artist_id integer references artists(id),
	genre_id integer references genre(id),
	constraint art_gen primary key(artist_id, genre_id)	
);
create table if not exists mix_tracks(
	mix_id integer references mix(id) ,
	track_list_id integer references track_list(id),
	constraint mix_tr primary key(mix_id, track_list_id)
);