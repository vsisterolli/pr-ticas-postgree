CREATE DATABASE curso;

CREATE TABLE class (
    id SERIAL PRIMARY KEY,
    code TEXT NOT NULL
);

CREATE TABLE modules (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    actual_class_id INTEGER NOT NULL REFERENCES class(id)
);

CREATE TABLE class_transitions (
    id SERIAL PRIMARY KEY,
    transactioned_student_od INTEGER NOT NULL REFERENCES students(id),
    previous_class TEXT,
    created_at timestamp DEFAULT NOW()
);

CREATE TYPE grade_type AS ENUM('Abaixo das Expectativas', 'Dentro das Expectativas', 'Acima das Expectativas');

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    module INTEGER NOT NULL REFERENCES modules(id),
    student INTEGER NOT NULL REFERENCES students(id),
    grade grade_type
);