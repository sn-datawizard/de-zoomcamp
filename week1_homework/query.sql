--Question 3
select count("VendorID") as num_count from nytripdata where lpep_pickup_datetime = '2019-01-15'

--Question 4
select "lpep_pickup_datetime", trip_distance from nytripdata order by trip_distance desc

--Question 5
select "lpep_pickup_datetime", "passenger_count", count("passenger_count") as num_passenger from nytripdata where lpep_pickup_datetime = '2019-01-01' group by 1, 2

--Question 6
select
d."PULocationID",
d."DOLocationID",
d."tip_amount",
z."Zone" as "PUZone"
into temporary table nytrip
from nytripdata as d
join nytripzones as z
on d."PULocationID" = z."LocationID"
where z."Zone" = 'Astoria'
order by d."tip_amount" desc

select
nytrip."PULocationID",
nytrip."DOLocationID",
nytrip."tip_amount",
nytripzones."Zone" as "DOZone"
from nytrip
join nytripzones
on nytrip."DOLocationID" = nytripzones."LocationID"