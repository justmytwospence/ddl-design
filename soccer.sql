-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ZT3sEO
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Team" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    CONSTRAINT "pk_Team" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goal" (
    "id" int   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    CONSTRAINT "pk_Goal" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Player" (
    "id" int   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_Player" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Referee" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    "salary" float   NOT NULL,
    CONSTRAINT "pk_Referee" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Match" (
    "id" int   NOT NULL,
    "home_team_id" int   NOT NULL,
    "away_team_id" int   NOT NULL,
    "season_id" int   NOT NULL,
    "referee_id" int   NOT NULL,
    CONSTRAINT "pk_Match" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Season" (
    "id" int   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_Season" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Goal" ADD CONSTRAINT "fk_Goal_player_id" FOREIGN KEY("player_id")
REFERENCES "Player" ("id");

ALTER TABLE "Goal" ADD CONSTRAINT "fk_Goal_match_id" FOREIGN KEY("match_id")
REFERENCES "Match" ("id");

ALTER TABLE "Player" ADD CONSTRAINT "fk_Player_team_id" FOREIGN KEY("team_id")
REFERENCES "Team" ("id");

ALTER TABLE "Match" ADD CONSTRAINT "fk_Match_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "Team" ("id");

ALTER TABLE "Match" ADD CONSTRAINT "fk_Match_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "Team" ("id");

ALTER TABLE "Match" ADD CONSTRAINT "fk_Match_season_id" FOREIGN KEY("season_id")
REFERENCES "Season" ("id");

ALTER TABLE "Match" ADD CONSTRAINT "fk_Match_referee_id" FOREIGN KEY("referee_id")
REFERENCES "Referee" ("id");

