BEGIN;

CREATE SCHEMA IF NOT EXISTS airtraffic;
SET LOCAL search_path TO airtraffic;

DROP TABLE IF EXISTS airline, passenger, city, country, ticket;

CREATE TABLE airline (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO airline (name) VALUES
('Air China'), -- 1
('American Airlines'), -- 2
('Avianca Brasil'), -- 3
('British Airways'), -- 4
('Delta'), -- 5
('TUI Fly Belgium'), -- 6
('United'); -- 7

CREATE TABLE passenger (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO passenger (first_name, last_name) VALUES
('Alvin', 'Leathes'), -- 1
('Berkie', 'Wycliff'), -- 2
('Cory', 'Squibbes'), -- 3
('Jennifer', 'Finch'), -- 4
('Sonja', 'Pauley'), -- 5
('Thadeus', 'Gathercoal'), -- 6
('Waneta', 'Skeleton'); -- 7

CREATE TABLE country (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO country (name) VALUES
('Brazil'), -- 1
('Chile'), -- 2
('China'), -- 3
('France'), -- 4
('Japan'), -- 5
('Mexico'), -- 6
('Morocco'), -- 7
('UAE'), --8
('United Kingdom'), -- 9
('United States'); -- 10

CREATE TABLE city (
  id SERIAL PRIMARY KEY,
  country_id INT REFERENCES country(id),
  name TEXT NOT NULL
);

INSERT INTO city (country_id, name) VALUES
(1, 'Sao Paolo'), -- 1
(2, 'Santiago'), -- 2
(3, 'Beijing'), -- 3
(4, 'Paris'), -- 4
(5, 'Tokyo'), -- 5
(6, 'Mexico City'), -- 6
(7, 'Casablanca'), -- 7
(8, 'Dubai'), -- 8
(9, 'London'), -- 9
(10, 'Cedar Rapids'), -- 10
(10, 'Charlotte'), -- 11
(10, 'Chicago'), -- 12
(10, 'Los Angeles'), -- 13
(10, 'Las Vegas'), -- 14
(10, 'New Orleans'), -- 15
(10, 'Seattle'), -- 17
(10, 'New York'), -- 16
(10, 'Washington DC'); -- 17

CREATE TABLE ticket (
  id SERIAL PRIMARY KEY,
  passenger_id INT REFERENCES passenger(id),
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES airline(id),
  from_city INT REFERENCES city(id),
  to_city INT REFERENCES city(id)
);

INSERT INTO ticket (passenger_id, seat, departure, arrival, airline_id, from_city, to_city) VALUES
  (1, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 2, 10, 12),
  (2, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 2, 11, 15),
  (2, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 7, 14, 11),
  (3, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 3, 1, 2),
  (4, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 5, 15, 6),
  (4, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 7, 16, 11),
  (5, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 5, 13, 14),
  (6, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 1, 8, 3),
  (6, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 4, 5, 9),
  (7, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 6, 4, 7);

COMMIT;