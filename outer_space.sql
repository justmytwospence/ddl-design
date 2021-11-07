BEGIN;

CREATE SCHEMA IF NOT EXISTS outerspace;
SET LOCAL search_path TO outerspace;

DROP TABLE IF EXISTS
"Galaxy",
"Moon",
"Planet",
"Star"
CASCADE;

CREATE TABLE "Galaxy" (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO "Galaxy" (name) VALUES
('Milky Way'),
('Proxima Centauri');

CREATE TABLE "Star" (
  id SERIAL PRIMARY KEY,
  galaxy_id INT REFERENCES "Galaxy"(id),
  name TEXT NOT NULL
);

INSERT INTO "Star" (galaxy_id, name) VALUES
(1, 'The Sun'),
(1, 'Gliese 876'),
(2, 'Proxima Centauri b');

CREATE TABLE "Planet" (
  id SERIAL PRIMARY KEY,
  star_id INT REFERENCES "Star"(id),
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL
);

INSERT INTO "Planet" (star_id, name, orbital_period_in_years) VALUES
(1, 'Earth', 1.0),
(1, 'Mars', 1.88),
(1, 'Venus', 0.62),
(1, 'Neptune', 164.8),
(3, 'Proxima Centauri b', 0.03),
(2, 'Gliese 876 b', 0.23);

CREATE TABLE "Moon" (
  id SERIAL PRIMARY KEY,
  planet_id INT REFERENCES "Planet"(id),
  name TEXT NOT NULL
);

INSERT INTO "Moon" (planet_id, name) VALUES
(1, 'The Moon'),
(2, 'Phobos'),
(2, 'Deimos'),
(4, 'Naiad'),
(4, 'Thalassa'),
(4, 'Despina'),
(4, 'Galatea'),
(4, 'Larissa'),
(4, 'S/2004 N 1'),
(4, 'Proteus'),
(4, 'Triton'),
(4, 'Nereid'),
(4, 'Halimede'),
(4, 'Sao'),
(4, 'Laomedeia'),
(4, 'Psamathe'),
(4, 'Neso');

COMMIT;