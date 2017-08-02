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
SELECT (first_name || ' ' || last_name) AS full_name, COUNT(first_name || ' ' || last_name) AS occurences FROM actors GROUP BY (first_name || last_name) ORDER BY COUNT(first_name || ' ' || last_name) DESC LIMIT 5;

# prolific
SELECT actors.first_name, actors.last_name, COUNT(roles.actor_id) AS role_count FROM actors LEFT JOIN roles ON actors.id=roles.actor_id GROUP BY roles.actor_id ORDER BY COUNT(roles.actor_ID) DESC LIMIT 20;

SELECT first_name, last_name, COUNT(*) AS role_count FROM actors join roles ON actors.id=roles.actor_id GROUP BY actors.id ORDER BY role_count DESC LIMIT 20;

#bottom of the barrel
SELECT genre, COUNT(genre) AS num_movies_by_genres FROM movies_genres GROUP BY genre ORDER BY COUNT(genre) ASC;

SELECT genre, COUNT(*) FROM movies_genres JOIN movies ON movies.id = movies_genres.movie_id GROUP BY genre ORDER BY COUNT(*) asc;

#Braveheart
SELECT first_name, last_name FROM ACTORS
  INNER JOIN roles ON actors.id = roles.actor_id
  INNER JOIN movies
    ON roles.movie_id = movies.id
    AND movies.name = 'Braveheart'
    AND movies.year = 1995
ORDER BY last_name;

#LEAP NOIR
#List all the directors who directed a "Film-Noir" movie in a leap year (you need #to check that the year is divisible by 4). Your query should return
#director name, the movie name, and the year, sorted by movie name

SELECT *
FROM movies AS m
  INNER JOIN movies_genres AS mg
    ON m.id = mg.movie_id
    AND mg.genre = 'Film-Noir'
      INNER JOIN movies_directors AS md ON m.id = md.movie_id
      INNER JOIN directors AS d ON md.director_id = d.id
WHERE year % 4 = 0
ORDER BY m.name ASC;
