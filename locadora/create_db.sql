CREATE DATABASE disk_rentals;

CREATE TABLE actors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT NOT NULL,
    bithday timestamp WITH TIME ZONE NOT NULL
);

CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE actions (
    id SERIAL PRIMARY KEY,
    movie_id INTEGER NOT NULL REFERENCES movies(id),
    actor_id INTEGER NOT NULL REFERENCES actors(id)   
)

CREATE TABLE disks (
    id SERIAL PRIMARY KEY,
    number INTEGER NOT NULL,
    barcode TEXT NOT NULL,
    movie_id INTEGER NOT NULL REFERENCES movies(id)
);

CREATE TABLE address (
    id SERIAL PRIMARY KEY,
    street TEXT NOT NULL,
    number TEXT NOT NULL,
    additional_info TEXT NOT NULL,
    district TEXT NOT NULL,
    postal_code TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL
)

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    addres_id  REFERENCES address(id)
);

CREATE TABLE rents (
    id SERIAL PRIMARY KEY,
    disk_id INTEGER NOT NULL REFERENCES disks(id),
    actor_id INTEGER NOT NULL REFERENCES clients(id),   
    located_at timestamp WITH TIMEZONE DEFAULT NOW(),
    returned_at timestamp WITH TIMEZONE,
    movie_rating INTEGER NOT NULL,
    service_rating INTEGER NOT NULL
);