BEGIN;

CREATE SCHEMA IF NOT EXISTS music;
SET LOCAL search_path TO music;

DROP TABLE IF EXISTS
"Album",
"Artist",
"ArtistSong",
"Producer",
"ProducerSong",
"Song"
CASCADE;

CREATE TABLE "Album" (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO "Album" (name) VALUES
('A Night at the Opera'), -- 1
('A Star is Born'), -- 2
('Daydream'), -- 3
('Hands All Over'), -- 4
('Let Go'), -- 5
('Middle of Nowhere'), -- 6
('Prism'), -- 7
('Silver Side Up'), -- 8
('The Blueprint 3'), -- 9
('The Writing''s on the Wall'); -- 10

CREATE TABLE "Song" (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INT REFERENCES "Album"(id)
);

INSERT INTO "Song" (title, duration_in_seconds, release_date, album_id) VALUES
('Bohemian Rhapsody', 355, '10-31-1975', 1),
('Complicated', 244, '05-14-2002', 5),
('Dark Horse', 215, '12-17-2013', 7),
('How You Remind Me', 223, '08-21-2001', 8),
('MMMBop', 238, '04-15-1997', 6),
('Moves Like Jagger', 201, '06-21-2011', 4),
('New York State of Mind', 276, '10-20-2009', 9),
('One Sweet Day', 282, '11-14-1995', 3),
('Say My Name', 240, '11-07-1999', 10),
('Shallow', 216, '09-27-2018', 2);

CREATE TABLE "Artist" (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO "Artist" (name) VALUES
('Alicia Keys'), -- 1
('Avril Lavigne'), -- 2
('Boys II Men'), -- 3
('Bradley Cooper'), -- 4
('Christina Aguilera'), -- 5
('Destiny''s Child'), -- 6
('Hanson'), -- 7
('Jay Z'), -- 8
('Juicy J'), -- 9
('Katy Perry'), -- 10
('Lady Gaga'), -- 11
('Mariah Cary'), -- 12
('Maroon 5'), -- 13
('Nickelback'), -- 14
('Queen'); -- 15

CREATE TABLE "Producer" (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);


CREATE TABLE "ArtistSong" (
  artist_id INT REFERENCES "Artist"(id),
  song_id INT REFERENCES "Song"(id)
);

INSERT INTO "Producer" (name) VALUES
('Al Shux'), -- 1
('Benjamin Rice'), -- 2
('Benny Blanco'), -- 3
('Cirkut'), -- 4
('Darkchild'), -- 5
('Dust Brothers'), -- 6
('Max Martin'), -- 7
('Rick Parashar'), -- 8
('Roy Thomas Baker'), -- 9
('Shellback'), -- 10
('Stephen Lironi'), -- 11
('Walter Afanasieff'); -- 12

CREATE TABLE "ProducerSong" (
  producer_id INT REFERENCES "Producer"(id),
  song_id INT REFERENCES "Song"(id)
);

--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

COMMIT;