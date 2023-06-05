--Average rating 

select *
from app_store_apps
where rating> (select avg(rating) 
			  from app_store_apps) as avg_rating
and price::money= 0



select cast(price as money)
from play_store_apps,(select price)
where rating>(select avg(rating)
			 from play_store_app
			 



---Top10
			  
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
LIMIT 10;




---top four
			  
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











select name,type,apple.review_count,play.review_count,cast(play.price as money),cast(apple.price as money),avg(play.rating),avg(play.rating)
from app_store_apps as apple
inner join play_store_apps as play
using(name)
where name like '%Airbnb%';



select name, price::money,rating,review_count::integer
from play_store_apps as play
where name like '%Airbnb%'
union all
select name, price::money,rating,review_count::integer
from app_store_apps as apple
group by name;



select  distinct name,type,apple.review_count::integer as app_rate,play.review_count ,play.price::money,apple.price::money,play.rating,apple.rating
from app_store_apps as apple
inner join play_store_apps as play
using(name)
where name like '%Airbnb%';


select count()
from play_store_apps


