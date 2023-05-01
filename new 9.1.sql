
create table genre_of_music(
  id serial primary key,
  name varchar(50) unique not null);

create table Executor(
  id serial primary key,
  name varchar(50) not null);
  
create table if not exists genre_of_music_Executor(
  genre_id integer references genre_of_music(id),
  Executor_id integer references  Executor(id),
  constraint pk1 primary key (genre_id, Executor_id)); 

create table Albums(
  id serial primary key,  
  name varchar(50) not null,
  year integer not null check(year > 0));
  
 create table if not exists Executor_Albums(
  Executor_id integer references Executor(id),
  Albums_id integer references  Albums(id),
  constraint pk2 primary key (Executor_id, Albums_id) 
);

create table Tracks(
  id serial primary key,
  name varchar(50) not null,
  track_duration integer not null check(track_duration > 0),
  Albums_id integer references  Albums(id));

create table Collections(
  id serial primary key,  
  name varchar(50) not null,
  year integer not null check(year > 0)
);

create table Tracks_Collections (
  Collections_id integer references  Collections(id),
  Tracks_id integer references  Tracks(id),
  constraint pk4 primary key (Tracks_id, Collections_id));




  
  