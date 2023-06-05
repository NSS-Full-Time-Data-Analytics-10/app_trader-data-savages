-----APPLE total 7197 rows
SELECT *
FROM app_store_apps;

------ PLAY total 10840 rows, DISTINCT NAME 9659
SELECT *
FROM play_store_apps;
SELECT *
FROM play_store_apps
WHERE name = 'Instagram';

-----JOINING BOTH WHOLE TABLES
SELECT *
FROM app_store_apps
	INNER JOIN play_store_apps
	USING (name);

---------------- AVG RATING ACROSS BOTH STORES by darina
SELECT AVG(rating) AS average_rating
FROM (
  SELECT rating FROM app_store_apps
  UNION ALL
  SELECT rating FROM play_store_apps
) AS both_apps;
---*-*-*-*-*-*-*-*-*-*BASE TABLE*-*-*-*-*-*-*-*-*
WITH apple AS (SELECT name, price::money AS a_price, rating AS a_rating, content_rating AS a_content_rating, 
			   review_count::integer AS a_review_count, primary_genre AS a_genre
			   FROM app_store_apps), 
	 play AS  (SELECT name, price::money AS p_price, rating AS p_rating, content_rating AS p_content_rating, 
			   review_count::integer AS p_review_count, genres AS p_genre
			   FROM play_store_apps)
SELECT *
FROM apple 
	INNER JOIN play
	USING(name);
-------------WHERE BOTH RATINGS ARE >4.0 = 294 APPS
WITH apple AS (SELECT DISTINCT name, price::money AS a_price, rating AS a_rating, content_rating AS a_content_rating, 
			   review_count::integer AS a_review_count, primary_genre AS a_genre
			   FROM app_store_apps), 
	 play AS  (SELECT DISTINCT name, price::money AS p_price, rating AS p_rating, content_rating AS p_content_rating, 
			   review_count::integer AS p_review_count, genres AS p_genre
			   FROM play_store_apps)
SELECT *
FROM apple 
	INNER JOIN play
	USING(name)
WHERE p_rating >4.0 AND a_rating >4.0;
---------------WHERE RATINGS ARE >= 4.5 AND FREE =132 APPS
WITH apple AS (SELECT DISTINCT name, price::money AS a_price, rating AS a_rating, content_rating AS a_content_rating, 
			   review_count::integer AS a_review_count, primary_genre AS a_genre
			   FROM app_store_apps), 
	 play AS  (SELECT DISTINCT name, price::money AS p_price, rating AS p_rating, content_rating AS p_content_rating, 
			   review_count::integer AS p_review_count, genres AS p_genre
			   FROM play_store_apps)
SELECT *
FROM apple 
	INNER JOIN play
	USING(name)
--WHERE p_rating >=4.5 AND a_rating >=4.5
	WHERE  a_price = '$0.00' 
	AND p_price = '$0.00';
------------------------72 
WITH apple AS (SELECT DISTINCT name, price::money AS a_price, rating AS a_rating, content_rating AS a_content_rating, 
			   primary_genre AS a_genre
			   FROM app_store_apps), 
	 play AS  (SELECT DISTINCT name, price::money AS p_price, rating AS p_rating, content_rating AS p_content_rating, 
			   genres AS p_genre
			   FROM play_store_apps)
SELECT name, a_genre, p_genre, (a_rating + p_rating)/2 AS avg_rating
FROM apple 
	INNER JOIN play
	USING(name)
WHERE p_rating >=4.5 AND a_rating >=4.5
	AND a_price = '$0.00' 
	AND p_price = '$0.00'
ORDER BY avg_rating DESC
LIMIT 10
------apple 23 play 119
SELECT DISTINCT primary_genre
FROM app_store_apps

SELECT DISTINCT genres
FROM play_store_apps
-------
WITH apple AS (SELECT DISTINCT name, price::money AS a_price, rating AS a_rating, content_rating AS a_content_rating, 
			   primary_genre AS a_genre
			   FROM app_store_apps), 
	 play AS  (SELECT DISTINCT name, price::money AS p_price, rating AS p_rating, content_rating AS p_content_rating, 
			   genres AS p_genre
			   FROM play_store_apps)
SELECT name, a_genre, (a_rating + p_rating)/2 AS avg_rating 
FROM apple 
	INNER JOIN play
	USING(name)
WHERE a_price = '$0.00' 
	AND p_price = '$0.00'
	AND name LIKE 'Airbnb'OR name LIKE 'Uber' OR name LIKE 'Instagram' OR name LIKE 'DoorDash - Food Delivery' 



