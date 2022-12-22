CREATE DATABASE flights;

CREATE TABLE agency (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    acronym VARCHAR(8) NOT NULL
);

CREATE TABLE airport (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    acronym VARCHAR(20) NOT NULL
);

CREATE TABLE flight (
    id SERIAL PRIMARY KEY,
    acronym VARCHAR(20) NOT NULL,
    start_time timestamp NOT NULL,
    end_time timestamp,
    agency_id integer NOT NULL REFERENCES agency(id),
    initial_airport_id integer NOT NULL REFERENCES airport(id),
    end_airport_id integer NOT NULL REFERENCES airport(id)
);