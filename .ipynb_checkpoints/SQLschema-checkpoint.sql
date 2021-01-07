create table movies(
	imdb_title_id varchar not null,
	title varchar,
	genre varchar,
	director varchar,
	writer varchar,
	actors varchar,
	votes int,
	Year_Published int,
	primary key(imdb_title_id));
	


create table names(
	imdb_name_id varchar,
	name varchar,
	primary key(imdb_name_id)); 
	
create table titles(
	imdb_title_id varchar,
	imdb_name_id varchar,
	category varchar,
	primary key(imdb_name_id, imdb_title_id),
	FOREIGN KEY (imdb_name_id) REFERENCES names(imdb_name_id),
	FOREIGN KEY (imdb_title_id) REFERENCES movies(imdb_title_id));




/*drop table ratings;*/
create table ratings(
	total_votes int,
	weighted_average_vote float,
	imdb_title_id varchar,
	allgenders_18age_avg_vote float,
	allgenders_30age_avg_vote float,
	allgenders_45age_avg_vote float,
	males_allages_avg_vote float,
	females_allages_avg_vote float,
	us_voters_votes float,
	non_us_voters_votes float,
	primary key(imdb_title_id),
	FOREIGN KEY (imdb_title_id) REFERENCES movies(imdb_title_id));
 

create table movie_demographic(
	imdb_title_id varchar,
	title varchar,
	genre varchar,
	votes int,
	Year_Published int,
	PRIMARY KEY (imdb_title_id),
	FOREIGN KEY (imdb_title_id) REFERENCES movies(imdb_title_id)
);


create table profession(
	profession varchar,
	profession_id varchar (4)
	primary key (profession_id)
);