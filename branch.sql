select *,price
from play_store_apps;

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



