create table genre of music(
  id serial primary key,
  name varchar(50) unique not null);

create table Executor(
  id serial primary key,
  name varchar(50) not null);
  
create table if not genre of music_Executor(
  genre_id integer references genre of music(id),
  Executor_id integer references  Executor(id),
  constraint pk1 primary key (genre_id, Executor_id) 
);

create table Albums(
  id serial primary key,  
  name varchar(50) not null),
  year integer not null check(year > 0)
);
  
 create table if not Executor_Albums(
  Executor_id integer references genre of Executor(id),
  Albums_id integer references  Albums(id),
  constraint pk2 primary key (Executor_id, Albums_id) 
);

create table Tracks(
  id serial primary key,
  name varchar(50) not null);
  

create table Collections(
  id serial primary key,  
  name varchar(50) not null,
  year integer not null check(year > 0)
);

create table Tracks_Collections (
  Collections_id integer references  Collections(id),
  Tracks_id integer references  Tracks(id),
  constraint pk4 primary key (Tracks_id, Collections_id) 
).




  
  