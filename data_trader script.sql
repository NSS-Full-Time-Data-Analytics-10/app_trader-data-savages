SELECT*
FROM app_store_apps

SELECT price::money
FROM play_store_apps
ORDER BY price DESC

SELECT AVG(price::money) 
FROM play_store_apps
ORDER BY price DESC


SELECT *
FROM play_store_apps
WHERE price >= 0.99

--- KEY table shared across the board
SELECT *
FROM app_store_apps AS apple
INNER JOIN play_store_apps AS play
USING(name)

SELECT *
FROM app_store_apps AS apple
INNER JOIN play_store_apps AS play
USING(name)
ORDER BY apple.price, play.price DESC


SELECT*
FROM app_store_apps
ORDER BY price DESC






--What we know
	--There are 553 games that are avaliable on both the Apple Store and Play Store.
			SELECT *
			FROM app_store_apps AS apple
			INNER JOIN play_store_apps AS play
			USING(name)
	--474 of those apps are free
			SELECT *
			FROM app_store_apps AS apple
			INNER JOIN play_store_apps AS play
			USING(name)
			WHERE apple.price = 0.00 AND play.price ='0'
	--70 of those apps cost money
			SELECT *
			FROM app_store_apps AS apple
			INNER JOIN play_store_apps AS play
			USING(name)
			WHERE apple.price > 0.00 AND play.price ='0'

--Potential Initial Investment Cost Across if we bought all rights to 553 games
	--Free games = 25,000*490 = 12,250,000
SELECT *
FROM app_store_apps AS apple
INNER JOIN play_store_apps AS play
USING(name)
WHERE apple.price = 0.00 AND play.price ='0'

---code for free apple store apps


--code for free play store apps
SELECT *
FROM app_store_apps AS apple
INNER JOIN play_store_apps AS play
USING(name)
WHERE play.price ='0'
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


SELECT *
FROM (
  SELECT * FROM app_store_apps
  UNION ALL
  SELECT * FROM play_store_apps
) AS both_apps
WHERE app_store_apps.rating >= 3.5 AND play_store_apps.rating >=3.5

---------------------------------------------------------------------












--If we're in front of stakeholders, we should consider these select options for both stores becasue they allow apples to apples comparison. 
---APPLE CONTENT
SELECT name, price::money, content_rating, review_count::integer, primary_genre
FROM app_store_apps;
---PLAY CONTENT 
SELECT name, price::money, content_rating, review_count::integer, genres 
FROM play_store_apps;


--Average price for apple games = 1.73
SELECT AVG(price)::money
FROM app_store_apps;

---Avergae price for play store games=
SELECT (AVG price)::money
FROM play_store_apps;


