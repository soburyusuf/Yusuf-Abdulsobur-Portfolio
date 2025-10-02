-- JOIN 2 TABLES USING UNION FUNCTION
USE bike_data; 
with sm as (
SELECT * FROM bike_share_0
union all
select * from bike_share_yr_1)


select
dteday,
season,
a.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS, 
riders * price as revenue, 
riders * price - COGS as profit
from sm a
left join cost_table b
on a.yr = b.yr