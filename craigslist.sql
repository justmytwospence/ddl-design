BEGIN;

CREATE SCHEMA IF NOT EXISTS craigslist;
SET LOCAL search_path TO craigslist;

DROP TABLE IF EXISTS
"Category",
"Post",
"Region",
"User"
CASCADE;

CREATE TABLE "Region" (
    "id" serial PRIMARY KEY,
    "name" varchar NOT NULL
);

INSERT INTO "Region" (name) VALUES
('Nashville'),
('Houston'),
('San Francisco'),
('Thailand'),
('New York'),
('Denver');

CREATE TABLE "Category" (
    "id" serial PRIMARY KEY,
    "name" varchar NOT NULL
);

INSERT INTO "Category" (name) VALUES
('Housing'),
('Missed Connection'),
('Furniture');

CREATE TABLE "User" (
    "id" serial PRIMARY KEY,
    "region_id" int REFERENCES "Region"(id),
    "name" varchar NOT NULL
);

INSERT INTO "User" (region_id, name) VALUES
(6, 'Spencer Boucher'),
(1, 'Grace Boucher'),
(6, 'Eric Rasch');

CREATE TABLE "Post" (
    "id" serial PRIMARY KEY,
    "user_id" int REFERENCES "User"(id),
    "category_id" int REFERENCES "Category"(id),
    "region_id" int REFERENCES "Region"(id), -- how to set the default to the user's region?
    "title" varchar NOT NULL,
    "text" varchar,
    "location" varchar
);

INSERT INTO "Post" (user_id, category_id, region_id, title) VALUES
(1, 3, 6, 'Couch for sale!'),
(2, 1, 1, 'Room for rent!'),
(3, 2, 2, 'To the person at the laundromat...');

COMMIT;