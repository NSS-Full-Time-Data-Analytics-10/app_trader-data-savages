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
having avg(price)
;

select  distinct name,type,apple.review_count::integer as app_rate,play.review_count ,play.price::money,apple.price::money,play.rating,apple.rating
from app_store_apps as apple
inner join play_store_apps as play
using(name)
where name like '%Airbnb%';


select 
from play_store_apps


