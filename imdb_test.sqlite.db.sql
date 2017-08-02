CREATE TABLE movies (
    id INTEGER PRIMARY KEY ,
    name TEXT DEFAULT NULL,
    year INTEGER DEFAULT NULL,
    rank REAL DEFAULT NULL
);


CREATE TABLE actors (
    id INTEGER PRIMARY KEY ,
    first_name TEXT DEFAULT NULL,
    last_name TEXT DEFAULT NULL,
    gender TEXT DEFAULT NULL
);

CREATE TABLE roles (
    actor_id INTEGER,
    movie_id INTEGER,
    role_name TEXT DEFAULT NULL
);

#years of the average of our birthyear
SELECT name, year FROM movies WHERE year=1992;

#initially trying to get all the movies in 1982
SELECT name, year FROM movies WHERE year=1982;

#figured out by searching how to find the # of movies in 1982 with COUNT function
SELECT COUNT(name) FROM movies WHERE year=1982;
