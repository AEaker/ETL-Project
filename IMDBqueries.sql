/*How many times actors appeared in movies in range of years*/
select n.name, count(m.title)
from names as n 
inner join titles as t on n.imdb_name_id = t.imdb_name_id
inner join movies as m on t.imdb_title_id = m.imdb_title_id
where t.category = 'actor' and m.year_published > 2015 or t.category = 'actress' and m.year_published = 2015
group by n.name
order by count(m.title) desc;


/*Count times has Tom Cruise been in movies since 2010*/
select n.name, count(m.title)
from names as n 
inner join titles as t on n.imdb_name_id = t.imdb_name_id
inner join movies as m on t.imdb_title_id = m.imdb_title_id
inner join movie_demo as md on md.imdb_title_id = m.imdb_title_id
where n.name like '%Tom Cruise%' and m.year_published > 2010 
group by n.name
order by count(m.title) desc;

/*where t.category = 'actor'*/ /*and md.genre = 'Action'*/
/*or t.category = 'actress'*/ /*and md.genre = 'Action'*/

/*Count of times actors/actresses have been in action movies since 2010*/
select n.name, count(m.title)
from names as n 
inner join titles as t on n.imdb_name_id = t.imdb_name_id
inner join movies as m on t.imdb_title_id = m.imdb_title_id
inner join movie_demo as md on md.imdb_title_id = m.imdb_title_id
where t.category = 'actor' and md.genre = 'Action' and m.year_published > 2010  or
t.category = 'actress' and md.genre = 'Action' and m.year_published > 2010 
group by n.name
order by count(m.title) desc;



/*How many movies did Humphrey Bogart act in?*/
select count(title) from movies
where actors LIKE '%Humphrey Bogart%';

/*50 Highest Rated Movies with more than 2000 votes.*/
select m.title, m.director, max(r.weighted_average_vote )
from movies as m 
inner join ratings as r on m.imdb_title_id = r.imdb_title_id
where r.total_votes >= 2000
group by m.title, m.director
order by max(r.weighted_average_vote) desc limit 50;

/*Most active director*/
select director, count(director) 
from movies
group by director
order by count(director) desc limit 1;


/*top 10 years with most movies made*/
select year_published, count(year_published)
from movies
group by year_published
order by count(year_published) desc limit 10;

/*acted and directed by same person*/
select title, director, actors
from movies
where actors like director;

/*acted and written by same person*/
select title, writer, actors
from movies
where actors like writer;

/*acted, written, directed by same person*/
select title, director, writer, actors
from movies
where director like writer and director like actors;

/*both genders, age 18 ratings for movie genre */
select movie_demo.genre, avg(ratings.allgenders_18age_avg_vote) as "Average Rating From All Genders 18 Age Group", 
count(movie_demo.imdb_title_id) as "Number of Films in Genre",
sum (ratings.total_votes) as "Total Votes for Genre"
from ratings inner join movie_demo on ratings.imdb_title_id=movie_demo.imdb_title_id
where movie_demo.votes >= 600
group by movie_demo.genre
order by avg(ratings.allgenders_18age_avg_vote) desc, count(ratings.allgenders_18age_avg_vote)desc;

/*both genders, age 30 ratings for movie genre */
select movie_demo.genre, avg(ratings.allgenders_30age_avg_vote) as "Average Rating From All Genders 30 Age Group", 
count(ratings.allgenders_30age_avg_vote) as "Number of Films in Genre",
sum (ratings.total_votes) as "Total Votes for Genre"
from ratings inner join movie_demo on ratings.imdb_title_id=movie_demo.imdb_title_id
where movie_demo.votes >= 600
group by movie_demo.genre
order by avg(ratings.allgenders_30age_avg_vote) desc, count(ratings.allgenders_30age_avg_vote)desc;

/*both genders, age 45 ratings for movie genre */
select movie_demo.genre, avg(ratings.allgenders_45age_avg_vote) as "Average Rating From All Genders 45 Age Group", 
count(ratings.allgenders_45age_avg_vote) as "Number of Films in Genre",
sum (ratings.total_votes) as "Total Votes for Genre"
from ratings inner join movie_demo on ratings.imdb_title_id=movie_demo.imdb_title_id
where movie_demo.votes >= 600
group by movie_demo.genre
order by avg(ratings.allgenders_45age_avg_vote) desc, count(ratings.allgenders_45age_avg_vote)desc;

/*Male All Ages Votes*/
select movie_demo.genre, avg(ratings.males_allages_avg_vote) as "Average Rating From Males All Age Group", 
count(ratings.males_allages_avg_vote) as "Number of Films in Genre",
sum (ratings.total_votes) as "Total Votes for Genre"
from ratings inner join movie_demo on ratings.imdb_title_id=movie_demo.imdb_title_id
where movie_demo.votes >= 600
group by movie_demo.genre
order by avg(ratings.males_allages_avg_vote) desc, count(ratings.males_allages_avg_vote)desc;

/*Female All Ages Votes*/
select movie_demo.genre, avg(ratings.females_allages_avg_vote) as "Average Rating From Females All Age Group", 
count(ratings.females_allages_avg_vote) as "Number of Films in Genre",
sum (ratings.total_votes) as "Total Votes for Genre"
from ratings inner join movie_demo on ratings.imdb_title_id=movie_demo.imdb_title_id
where movie_demo.votes >= 600
group by movie_demo.genre
order by avg(ratings.females_allages_avg_vote) desc, count(ratings.females_allages_avg_vote)desc;





/*Number of People in each Job Category */
select category, count(category)
from titles
group by category;

/*Number of people and jobs related to the Movie "Batman Begins"*/
select movies.title, titles.category, count(titles.category)
from movies
inner join titles on movies.imdb_title_id=titles.imdb_title_id
where movies.title like '%Batman Begins%'
group by movies.title, titles.category;


