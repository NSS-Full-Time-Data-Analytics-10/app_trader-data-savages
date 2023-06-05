WITH apple AS (SELECT DISTINCT name, price::money AS a_price, rating AS a_rating, content_rating AS a_content_rating, 
			   primary_genre AS a_genre
			   FROM app_store_apps), 
	 play AS  (SELECT DISTINCT name, price::money AS p_price, rating AS p_rating, content_rating AS p_content_rating, 
			   genres AS p_genre
			   FROM play_store_apps)
SELECT name, a_genre, p_genre, (a_rating+ p_rating)/2 AS avg_rating
FROM apple 
	INNER JOIN play
	USING(name)
WHERE p_rating >=4.5 AND a_rating >=4.5
	AND a_price = '$0.00' 
	AND p_price = '$0.00'
ORDER BY avg_rating DESC
LIMIT 10