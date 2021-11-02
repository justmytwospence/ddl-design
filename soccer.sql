BEGIN;

CREATE SCHEMA IF NOT EXISTS soccer;
SET LOCAL search_path TO soccer;

DROP TABLE IF EXISTS "Team", "Referee", "Season", "Player", "Match", "Goal", "RefereeMatch" CASCADE;

CREATE TABLE "Team" (
    "id" serial PRIMARY KEY,
    "name" varchar NOT NULL
);

INSERT INTO "Team" (name)
VALUES
('Baker'),
('Brown'),
('Duncan'),
('Hanszen'),
('Jones'),
('Lovett'),
('Martel'),
('McMurtry'),
('Sid Rich'),
('Will Rice'),
('Wiess');

CREATE TABLE "Referee" (
    "id" serial PRIMARY KEY,
    "name" varchar NOT NULL,
    "salary" float
);
INSERT INTO "Referee" (name, salary) VALUES
('Greg Boucher', 1555000),
('Garrett Boucher', 115000),
('Andy Hayslip', 105000);

CREATE TABLE "Season" (
    "id" serial PRIMARY KEY,
    "start_date" date NOT NULL,
    "end_date" date NOT NULL
);

INSERT INTO "Season" (start_date, end_date) VALUES
('2008-08-01', '2009-05-01'),
('2009-08-01', '2010-05-01'),
('2010-08-01', '2011-05-01');

CREATE TABLE "Player" (
    "id" serial PRIMARY KEY,
    "team_id" int REFERENCES "Team"(id),
    "name" varchar NOT NULL
);

INSERT INTO "Player" (name, team_id) VALUES
('Spencer Boucher', 4),
('Alisa Yu', 4),
('Charlie Behr', 9),
('Raymond Verm', 4),
('Amy Bridges', 2),
('Matt Youn', 2);

CREATE TABLE "Match" (
    "id" serial PRIMARY KEY,
    "home_team_id" int REFERENCES "Team"(id),
    "away_team_id" int REFERENCES "Team"(id),
    "outcome" varchar(4),
    "season_id" int REFERENCES "Season"(id),

    -- how to constrain the winning team according to actual goals?
    CONSTRAINT outcome CHECK (
        "outcome" IN ('home', 'away', 'tie')
    )
);

INSERT INTO "Match" (home_team_id, away_team_id, outcome, season_id) VALUES
(4, 9, 'home', 1),
(2, 4, 'away', 1),
(2, 9, 'away', 1),
(9, 4, 'away', 1);

CREATE TABLE "Goal" (
    "id" serial PRIMARY KEY,
    "match_id" int REFERENCES "Match"(id),
    "player_id" int REFERENCES "Player"(id)
);

-- how to constrain these to allowable match_id and player_id?
Insert INTO "Goal" (match_id, player_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 5),
(2, 1),
(2, 2),
(3, 3),
(3, 6),
(4, 1),
(4, 2),
(4, 3),
(4, 3);

CREATE TABLE "RefereeMatch" (
    "referee_id" int REFERENCES "Referee"(id),
    "match_id" int REFERENCES "Match"(id)
);

COMMIT;