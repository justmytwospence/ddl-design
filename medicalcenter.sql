DROP TABLE IF EXISTS "Hospital", "Doctor", "DoctorPatient", "Patient",
"PatientDisease", "Disease" CASCADE;

CREATE TABLE "Hospital" (
    "id" serial PRIMARY KEY,
    "name" varchar NOT NULL,
    "address" varchar
);

INSERT INTO "Hospital" (name, address) VALUES
('Gotham Hospital', 'New York'),
('Sacred Heart', 'Los Angeles');

CREATE TABLE "Doctor" (
    "id" serial PRIMARY KEY,
    "name" varchar,
    "hospital_id" int REFERENCES "Hospital"(id),
    "address" varchar,
    "salary" float
);

INSERT INTO "Doctor" (hospital_id, name, address, salary) VALUES
(2, 'JD', 'Los Angeles', 95000),
(2, 'Turk', 'Los Angeles', 95000),
(2, 'Elliott', 'Los Angeles', 95000);

CREATE TABLE "DoctorPatient" (
    "doctor_id" int REFERENCES "Doctor"(id),
    "patient_id" int REFERENCES "Doctor"(id)
);

INSERT INTO "DoctorPatient" (doctor_id, patient_id) VALUES
(1, 1),
(2, 2),
(1, 2);

CREATE TABLE "Patient" (
    "id" serial PRIMARY KEY,
    "name" varchar NOT NULL,
    "address" varchar
);

INSERT INTO "Patient" (name, address) VALUES
('Spencer Boucher', 'Fairfax Avenue'),
('Hilary Boucher', 'Pond View Court'),
('Greg Boucher', 'Pond View Court');

CREATE TABLE "Disease" (
    "id" serial PRIMARY KEY,
    "name" varchar NOT NULL
);

INSERT INTO "Disease" (name) VALUES
('Diptheria'),
('Measles'),
('Irritable Bowel Syndrome');

CREATE TABLE "PatientDisease" (
    "patient_id" int REFERENCES "Patient"(id),
    "disease_id" int REFERENCES "Disease"(id)
);

INSERT INTO "PatientDisease" (patient_id, disease_id) VALUES
(1, 1),
(2, 3),
(3, 1);
