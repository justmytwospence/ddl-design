-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/a7ARl1
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Region" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "User" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    "region_id" int   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Post" (
    "id" int   NOT NULL,
    "title" varchar   NOT NULL,
    "text" varchar   NOT NULL,
    "user_id" int   NOT NULL,
    "location" varchar   NOT NULL,
    "region_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    CONSTRAINT "pk_Post" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Category" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "User" ADD CONSTRAINT "fk_User_region_id" FOREIGN KEY("region_id")
REFERENCES "Region" ("id");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_user_id" FOREIGN KEY("user_id")
REFERENCES "User" ("id");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_region_id" FOREIGN KEY("region_id")
REFERENCES "Region" ("id");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("id");

