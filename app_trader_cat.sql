-----APPLE total 7197 rows
SELECT *
FROM play_store_apps
WHERE name = 'Airbnb';
SELECT DISTINCT name, *
FROM app_store_apps;

------ PLAY total 10840 rows, DISTINCT NAME 9659
SELECT *
FROM play_store_apps;
SELECT DISTINCT name
FROM play_store_apps;

-----JOINING BOTH WHOLE TABLES
SELECT *
FROM app_store_apps
	INNER JOIN play_store_apps
	USING (name);

---APPLE CONTENT
SELECT name, price::money, content_rating, review_count::integer, primary_genre
FROM app_store_apps;

---PLAY CONTENT 
SELECT name, price::money, content_rating, review_count::integer, genres 
FROM play_store_apps;
----------------------PLAYING WITH CTEs

WITH apple AS (SELECT name, price::money, content_rating, review_count::integer, primary_genre
			   FROM app_store_apps), 
	 play AS  (SELECT name, price::money, content_rating, review_count::integer, genres 
			   FROM play_store_apps)
SELECT * 
	FROM apple
UNION 
SELECT *
	FROM play;

---------------- AVG RATING ACROSS BOTH STORES by darina
SELECT AVG(rating) AS average_rating
FROM (
  SELECT rating FROM app_store_apps
  UNION ALL
  SELECT rating FROM play_store_apps
) AS both_apps;
------------ CTE WHERE ALL APPLE PRICE IS 0
WITH apple AS (SELECT name, price::money, content_rating, review_count::integer, primary_genre
			   FROM app_store_apps), 
	 play AS  (SELECT name, price::money, content_rating, review_count::integer, genres 
			   FROM play_store_apps)
SELECT *
FROM apple 
WHERE apple.price = '0.00';
--------------- USING CTE AND UNION
WITH apple AS (SELECT name, price::money, content_rating, review_count::integer, primary_genre
			   FROM app_store_apps),
	 play AS  (SELECT name, price::money, content_rating, review_count::integer, genres 
			   FROM play_store_apps)	   
SELECT * 
FROM apple

UNION

SELECT *
FROM play
WHERE ;
-------------SHARED APPS WHERE PRICE = $0 -*-*- COUNT 474
SELECT *
FROM app_store_apps
	INNER JOIN play_store_apps
	USING (name)
WHERE app_store_apps.price = 0
	AND play_store_apps.price ='0'
-------------

SELECT AVG(price::numeric)
FROM play_store_apps

