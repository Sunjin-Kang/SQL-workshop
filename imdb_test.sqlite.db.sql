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

#find actors with "stack" in their last name
SELECT id, first_name, last_name FROM actors WHERE last_name LIKE '%stack%';

#find the 10 most popular actor first names and last names
SELECT first_name, COUNT(first_name) AS occurences FROM actors GROUP BY first_name ORDER BY COUNT(first_name) DESC LIMIT 10;

#now output the most popular last names
SELECT last_name, COUNT(last_name) AS occurences FROM actors GROUP BY last_name ORDER BY COUNT(last_name) DESC LIMIT 10;

#now find the most popular full names
SELECT first_name, last_name, id FROM actors WHERE last_name='MacDonald';

SELECT COALESCE(first_name, last_name) FROM actors;

#
SELECT first_name, last_name, id FROM actors;
SELECT id, COUNT(id) AS id_count FROM movies GROUP BY id;

SELECT actor_id, movie_id, COUNT(actor_id) from roles;

SELECT actors.first_name, actors.last_name, COUNT(roles.actor_id) AS role_count FROM actors LEFT JOIN roles ON actors.id=roles.actor_id;
