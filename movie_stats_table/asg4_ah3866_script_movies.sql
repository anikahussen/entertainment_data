DROP TABLE IF EXISTS movies;

CREATE TABLE IF NOT EXISTS movies (
	'director_name'	TEXT,
	'num_critic_review' INTEGER,
	'duration' INTEGER, 
	'director_fb_likes'	INTEGER,
	'actor_1_fb_likes'	INTEGER,
	'gross' INTEGER,
	'genres' TEXT,
	'actor_1_name' TEXT,
	'title' TEXT,
	'num_voted_users' INTEGER,
	'cast_total_fb_likes' INTEGER,
	'num_user_review' INTEGER, 
	'language' TEXT, 
	'country' TEXT, 
	'content_rating' TEXT, 
	'budget' INTEGER, 
	'year' INTEGER, 
	'imdb_score' INTEGER, 
	'aspect_ratio' INTEGER, 
	'movie_fb_likes' INTEGER
);

.mode csv
.import asg4_ah3866_clean_movie_data.csv movies




###################################



#Counting all records
SELECT COUNT (*)
FROM movies;

.mode columns
.width 50 10 10 10 10

#Listing 10 records in reverse order
SELECT title, director_fb_likes, actor_1_fb_likes, cast_total_fb_likes, imdb_score
FROM movies
ORDER BY imdb_score DESC 
LIMIT 10;

#three important fields, title is alphabetical, wheere selection limiting budget, only 10 records
SELECT title, budget, gross
FROM movies 
WHERE budget < 500000
ORDER BY title 
LIMIT 10;

SELECT title, budget, gross
FROM movies
WHERE budget > 200000000
ORDER BY budget DESC
LIMIT 10;

#Group by to find numerical breakdowns like averages
SELECT country, AVG(gross) AS g
FROM movies 
GROUP BY country
ORDER BY country;

.width  20 10 10
SELECT COUNTRY, AVG(budget) as b, AVG(gross) as g
FROM movies 
GROUP BY country 
ORDER BY country;


SELECT COUNTRY, AVG(budget) as b, AVG(gross) as g
FROM movies
GROUP BY country
HAVING g > 20000000
ORDER BY g DESC;

SELECT COUNTRY, AVG(budget) as b, AVG(gross) as g
FROM movies
GROUP BY country
HAVING b > 20000000
ORDER BY b DESC;

#Query with having clause for limiting the average gross
SELECT country, AVG(budget) as b, AVG(gross) as g
FROM movies
GROUP BY country
HAVING b < 200000
ORDER BY b DESC;

#statistical breakdown of imdb_score
SELECT country, AVG(imdb_score) as i, MIN(imdb_score) as m, MAX(imdb_score) as a
FROM movies 
GROUP BY country
ORDER by i DESC;

#Counting textual data occurences (language of movies)
SELECT language, COUNT(*)
FROM movies 
GROUP BY language
ORDER BY language;

.width 100

#User friendly listing of first 15 records in alphabetical order, if there is a value in the first place 
SELECT (director_name || "," || title || "," || year|| " - "|| country) AS move
FROM movies
WHERE director_name != ""
ORDER by director_name
LIMIT 15;

.width 50

SELECT title, year
FROM movies
LIMIT 10;

#Query using SQLite Core Function "round"
SELECT round((AVG(gross)),2), country
FROM movies
GROUP BY country
LIMIT 10;

.width 50 50

#Query using SQLIte Core Function "replace"
SELECT title,  replace(genres, '|', ' ')
FROM movies
LIMIT 10;

.width 50 50 20

SELECT title,  replace(genres, '|', ' '), num_critic_review
FROM movies
ORDER BY num_critic_review DESC
LIMIT 15;


.width 50 50 50

#drama genre frequently does suprisingly well in most realms
SELECT title, imdb_score,  replace(genres, '|', ' ')
FROM movies
ORDER BY imdb_score DESC
LIMIT 15;

#scope of the data through country representation
SELECT country, COUNT(*)
FROM movies
GROUP BY country
ORDER BY country;

#social media involvemeent globally in the film industry
SELECT country, AVG(movie_fb_likes)
FROM movies
GROUP BY country
ORDER BY country
LIMIT 15;

SELECT country, AVG(movie_fb_likes) AS a
FROM movies
GROUP BY country
ORDER BY a DESC
LIMIT 15;

#comparing the regions/countries with the anount of money allocated to film — global/social dilemma
SELECT country,(AVG(gross)-AVG(budget)) AS p 
FROM movies
GROUP BY country
ORDER BY p DESC
LIMIT 15;

SELECT country,(AVG(gross)-AVG(budget)) AS p 
FROM movies
GROUP BY country
ORDER BY p 
LIMIT 15;

SELECT country, AVG(movie_fb_likes) AS a
FROM movies
GROUP BY country
ORDER BY a DESC
LIMIT 15;

#comparing investment in social media and film financial success 
SELECT country,(AVG(gross)-AVG(budget)) AS p, AVG(movie_fb_likes) AS a
FROM movies
GROUP BY country;

#exploring the trends in the countries outside of USA, as to compare to the edominant conutry in the industry
SELECT title, imdb_score, duration, aspect_ratio
FROM movies
WHERE country != "USA"
ORDER BY imdb_score
LIMIT 15;try

SELECT title, imdb_score, duration, aspect_ratio
FROM movies
WHERE country != "USA"
ORDER BY imdb_score DESC
LIMIT 15;


SELECT title, imdb_score, genres
FROM movies
ORDER BY imdb_score DESC
LIMIT 15;

#western genres do well outside of the west
SELECT title, imdb_score, genres
FROM movies
WHERE country != "USA"
ORDER BY imdb_score DESC
LIMIT 15;



