-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/cJDoEp
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Medical Center

CREATE TABLE "Hospital" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    "address" varchar   NOT NULL,
    CONSTRAINT "pk_Hospital" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Doctor" (
    "id" int   NOT NULL,
    "hospital_id" int   NOT NULL,
    "address" varchar   NOT NULL,
    "salary" float   NOT NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "DoctorPatient" (
    "doctor_id" int   NOT NULL,
    "patient_id" int   NOT NULL
);

CREATE TABLE "Patient" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    "address" varchar   NOT NULL,
    CONSTRAINT "pk_Patient" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "PatientDisease" (
    "patient_id" int   NOT NULL,
    "disease_id" int   NOT NULL
);

CREATE TABLE "Disease" (
    "id" int   NOT NULL,
    "name" varchar   NOT NULL,
    CONSTRAINT "pk_Disease" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Doctor" ADD CONSTRAINT "fk_Doctor_hospital_id" FOREIGN KEY("hospital_id")
REFERENCES "Hospital" ("id");

ALTER TABLE "DoctorPatient" ADD CONSTRAINT "fk_DoctorPatient_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctor" ("id");

ALTER TABLE "DoctorPatient" ADD CONSTRAINT "fk_DoctorPatient_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patient" ("id");

ALTER TABLE "PatientDisease" ADD CONSTRAINT "fk_PatientDisease_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patient" ("id");

ALTER TABLE "PatientDisease" ADD CONSTRAINT "fk_PatientDisease_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Disease" ("id");

CREATE INDEX "idx_Hospital_name"
ON "Hospital" ("name");

