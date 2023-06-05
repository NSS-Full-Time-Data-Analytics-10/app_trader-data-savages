-----Codes for tables-----
SELECT*
FROM app_store_apps;

SELECT *
FROM play_store_apps
ORDER BY price;
--- KEY table shared across the board--BASELINE
SELECT *
FROM app_store_apps AS apple
INNER JOIN play_store_apps AS play
USING(name)



----------------------------------RATINGS--------------------------
--average rating for apple store =3.5
SELECT AVG(rating) AS avg_rating
FROM app_store_apps AS apple

--average rating for play store = 4.1
SELECT AVG(rating) AS avg_rating
FROM play_store_apps AS play

--average rating across both = 3.9
SELECT AVG(rating) AS average_rating
FROM (
  SELECT rating FROM app_store_apps
  UNION ALL
  SELECT rating FROM play_store_apps
) AS both_apps;

--List of Apps avaliable for both stores where rating 3.5 or higher
SELECT play.name, apple.name, play.rating, apple.rating
FROM app_store_apps AS apple
INNER JOIN play_store_apps AS play
USING(name)
WHERE apple.rating >= 3.5 AND play.rating >=3.5


---------------------PRICING-------------------------------
--apple average price =1.73
SELECT *
FROM play_store_apps
---Avergae price for play store games( can;t find yet)
SELECT name,(price)::money, rating, genres
FROM play_store_apps
WHERE (price)::money = 0.00 AND rating Between 3.5 AND 5.0







SELECT name, price::money, rating, genres
FROM play_store_apps
WHERE price::money = '0.00' AND rating BETWEEN 3.5 AND 5.0;





SELECT*
FROM play_store_apps

SELECT price::money
FROM play_store_apps
ORDER BY price DESC


SELECT AVG(price::money) AS average_price
FROM (
    SELECT price::money
    FROM play_store_apps
    ORDER BY price DESC
) AS ordered_data;






--average price across both stores



------GENRE--------

SELECT*
FROM app_store_apps;

SELECT 
FROM app_store_apps
ORDER BY primary_genre


SELECT *
FROM play_store_apps
ORDER BY price;
--- KEY table shared across the board--BASELINE
SELECT *
FROM app_store_apps AS apple
INNER JOIN play_store_apps AS play
USING(name)

SELECT *
FROM play_store_apps
ORDER BY price;
--- KEY table shared across the board--BASELINE
SELECT *
FROM app_store_apps AS apple
INNER JOIN play_store_apps AS play
USING(name)

