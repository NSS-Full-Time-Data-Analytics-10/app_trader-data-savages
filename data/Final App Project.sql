

SELECT *
FROM app_store_apps
	INNER JOIN play_store_apps
	USING (name);
	
SELECT *
FROM app_store_apps;

SELECT DISTINCT rating
FROM play_store_apps;

SELECT AVG(price::numeric)
FROM play_store_apps;

WITH apple AS (SELECT DISTINCT name, price::money AS a_price, rating AS a_rating, content_rating AS a_content_rating, 
			   review_count::integer AS a_review_count, primary_genre AS a_genre
			   FROM app_store_apps), 
	 play AS  (SELECT DISTINCT name, price::money AS p_price, rating AS p_rating, content_rating AS p_content_rating, 
			   review_count::integer AS p_review_count, genres AS p_genre
			   FROM play_store_apps)
			   
--creating table that is both free and is both		   
SELECT *
FROM apple 
	INNER JOIN play
	USING(name)
WHERE p_rating >=4.5 AND a_rating >=4.5
	AND a_price = '$0.00' 
	AND p_price = '$0.00';

WITH apple AS (SELECT DISTINCT name, price::money AS a_price, rating AS a_rating, content_rating AS a_content_rating, 
			   primary_genre AS a_genre
			   FROM app_store_apps), 
	 play AS  (SELECT DISTINCT name, price::money AS p_price, rating AS p_rating, content_rating AS p_content_rating, 
			   genres AS p_genre
			   FROM play_store_apps)
SELECT *
FROM apple 
	INNER JOIN play
	USING(name)
WHERE p_rating >=4.5 AND a_rating >=4.5
	AND a_price = '$0.00' 
	AND p_price = '$0.00'
	
select name,play_store_apps.price::money,play_store_apps.rating, play_store_apps.genres
from play_store_apps
where play_store_apps.price = 0 and rating between 3.5 and 5.0;	


--3b
WITH apple AS (SELECT DISTINCT name, price::money AS a_price, rating AS a_rating, content_rating AS a_content_rating, 
			   primary_genre AS a_genre
			   FROM app_store_apps), 
	 play AS  (SELECT DISTINCT name, price::money AS p_price, rating AS p_rating, content_rating AS p_content_rating, 
			   genres AS p_genre
			   FROM play_store_apps)
SELECT *, (a_rating+ p_rating)/2 AS avg_rating
FROM apple 
	INNER JOIN play
	USING(name)
WHERE p_rating >=4.5 AND a_rating >=4.5
	AND a_price = '$0.00' 
	AND p_price = '$0.00'
ORDER BY avg_rating DESC
LIMIT 10

--3c--AirBNB--UBER--Insatgram--DoorDash
WITH apple AS (SELECT DISTINCT name, price::money AS a_price, rating AS a_rating, content_rating AS a_content_rating, 
			   primary_genre AS a_genre
			   FROM app_store_apps), 
	 play AS  (SELECT DISTINCT name, price::money AS p_price, rating AS p_rating, content_rating AS p_content_rating, 
			   genres AS p_genre
			   FROM play_store_apps)
SELECT *
FROM apple 
	INNER JOIN play
	USING(name)
WHERE a_price = '$0.00' 
	AND p_price = '$0.00'
	AND name LIKE 'Airbnb'OR name LIKE 'Uber' OR name LIKE 'Instagram' OR name LIKE 'DoorDash - Food Delivery'