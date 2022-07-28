
--количество исполнителей в каждом жанре
select count(artistgenre.genre_id), genre."name" from artistgenre
join genre on artistgenre.genre_id = genre.id 
group by artistgenre.genre_id, genre."name" 
order by count(artistgenre.genre_id);

--количество треков, вошедших в альбомы 2019-2020 годов;
select count(track_list.album_id), albums."name"  from track_list
join albums on track_list.album_id = albums.id 
group by track_list.album_id, albums.id
having albums."year" between 1965 and 1966
order by count(track_list.album_id);

--средняя продолжительность треков по каждому альбому

select round(avg(duration), 1) , a."name"  from track_list tl 
join albums a on tl.album_id = a.id 
group by a.id 
order by a.id;

--все исполнители, которые не выпустили альбомы в 2020 году
select ar.name, a."year" from artists ar 
join artistalbum al on ar.id = al.artist_id 
join albums a on al.album_id = a.id 
group by a."year", ar.name
having a."year" != 2020

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
select m.name, art.name from mix m
join mix_tracks mt on m.id = mt.mix_id 
join track_list tl on mt.track_list_id  = tl.id 
join albums a on tl.album_id = a.id 
join artistalbum aa on a.id = aa.album_id 
join artists art on aa.artist_id  = art.id 
group by m.name, art.name
having art.name = 'Джон Леннон'

--название альбомов, в которых присутствуют исполнители более 1 жанра
select albums.name  from artistgenre
 join artists on artistgenre.artist_id = artists.id 
 join artistalbum on artists.id = artistalbum.artist_id
 join albums on artistalbum.album_id = albums.id 
 group by artists."name", albums.name
 having count(artistgenre.artist_id)>1
 
-- наименование треков, которые не входят в сборники
 select name  from track_list
 left join mix_tracks on track_list.id = mix_tracks.track_list_id
 where mix_tracks.mix_id  is null
 group by name;

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
select a.name from artists a 
join artistalbum a2 on a.id = a2.artist_id 
join albums a3 on a2.album_id = a3.id 
join track_list tl on a3.id = tl.album_id  
where duration = (select min(duration) from track_list tl2)
group by a."name";

--название альбомов, содержащих наименьшее количество треков
select distinct albums.name from albums
join track_list on album_id = track_list.album_id 
where albums.id in 
(select album_id from track_list 
 group by album_id 
 having count(id) = 
 (select count(id) from track_list
 group by album_id 
 order by count
 limit 1));

select a."name"  from albums a
join track_list tl on a.id = tl.album_id 
group by a."name" 
having count(tl.id) = 
(select count(id) from track_list 
 group by album_id 
 order by count
 limit 1);

 