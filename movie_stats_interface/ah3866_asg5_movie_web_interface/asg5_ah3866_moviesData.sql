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



