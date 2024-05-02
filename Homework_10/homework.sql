-- Создать таблицы реакций и комментариев (на видео)

create table reactions(
	id int primary key auto_increment,
	created_at timestamp,
	video_id int,
	author_id int,
	reaction_type int)

create table comments(
	id int primary key auto_increment,
	created_at timestamp,
	video_id int,
	author_id int,
	content varchar(1000))

-- Добавить несколько записей в каждую таблицу выше
insert into reactions (created_at, video_id, author_id, reaction_type)
values
(current_timestamp(), 4, 1, 4),
(current_timestamp(), 5, 3, 2),
(current_timestamp(), 1, 5, 5)

insert into comments (created_at, video_id, author_id, content)
values
(current_timestamp(), 4, 1, 'I will fly to Germany in 6 days, this video is helpful'),
(current_timestamp(), 5, 3, 'Buy new microphone, the sound is weird'),
(current_timestamp(), 1, 5, 'One day I will see USA too')