SELECT*
FROM app_store_apps

SELECT *
FROM play_store_apps

--- KEY table
SELECT *
FROM app_store_apps
INNER JOIN play_store_apps
USING(name);

SELECT *
FROM app_store_apps
INNER JOIN play_store_apps
USING(name)
ORDER By genres




60


---493 apps are currently free
