
--���������� ������������ � ������ �����
select count(artistgenre.genre_id), genre."name" from artistgenre
join genre on artistgenre.genre_id = genre.id 
group by artistgenre.genre_id, genre."name" 
order by count(artistgenre.genre_id);


--���������� ������, �������� � ������� 2019-2020 �����;
select count(track_list.album_id), albums."name"  from track_list
join albums on track_list.album_id = albums.id 
where albums."year" between 1965 and 1966
group by track_list.album_id, albums.id


--������� ����������������� ������ �� ������� �������
select round(avg(duration), 1) , a."name"  from track_list tl 
join albums a on tl.album_id = a.id 
group by a.id 
order by a.id;


--��� �����������, ������� �� ��������� ������� � 2020 ����
select ar.name, a."year" from artists ar 
join artistalbum al on ar.id = al.artist_id 
join albums a on al.album_id = a.id 
where ar.name not in (select a2."name" from artists a2 where a."year" = 2013);


--�������� ���������, � ������� ������������ ���������� ����������� (�������� ����)
select m.name from mix m
join mix_tracks mt on m.id = mt.mix_id 
join track_list tl on mt.track_list_id  = tl.id 
join albums a on tl.album_id = a.id 
join artistalbum aa on a.id = aa.album_id 
join artists art on aa.artist_id  = art.id 
where art.name = '���� ������'


--�������� ��������, � ������� ������������ ����������� ����� 1 �����
 select a.name from albums a 
 join artistalbum a2 on a.id = a2.album_id 
 join artists a3 on a2.artist_id = a3.id 
 where a3.id in (select artist_id  from artistgenre group by artistgenre.artist_id having  count(genre_id) > 1)
 

 -- ������������ ������, ������� �� ������ � ��������
 select name  from track_list
 left join mix_tracks on track_list.id = mix_tracks.track_list_id
 where mix_tracks.mix_id  is null;


--�����������(-��), ����������� ����� �������� �� ����������������� ���� (������������ ����� ������ ����� ���� ���������)
select a.name from artists a 
join artistalbum a2 on a.id = a2.artist_id 
join albums a3 on a2.album_id = a3.id 
join track_list tl on a3.id = tl.album_id  
where duration = (select min(duration) from track_list tl2)
group by a."name";


--�������� ��������, ���������� ���������� ���������� ������
select a."name"  from albums a
join track_list tl on a.id = tl.album_id 
group by a."name" 
having count(tl.id) = 
(select count(id) from track_list 
 group by album_id 
 order by count
 limit 1);

 