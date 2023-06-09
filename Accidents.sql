Use Accidents;

Select * from records;

-- 1. Grouping Accidents by  district.

Select district, count(*) as Accident_count
From records
group by district
order by Accident_count desc;

-- 2. Grouping accidents by month.

Select month, count(*) as accident_count
From records
group by month
order by accident_count desc;

-- 3. Which kind of accidents happen most in June?

Select sum(bicycle), sum(car), sum(pedestrian), sum(motorbike), sum(truck),sum(other_vehicle)
From records
group by month
having month = "June";

-- bicycle = '675', car = '1132',pedestrian = '143',motorbike = '248',truck = '60',other_vehicle = '179'

Select sum(bicycle), sum(car), sum(pedestrian), sum(motorbike), sum(truck),sum(other_vehicle)
From records
group by month
having month = "August";

-- '650','1040','148','262','32','182'

-- 4. On which street do most accidents happen? 

Select street, count(*) as count
From records
group by street
order by count desc
limit 10;

-- 5. What kind of accidents happen on 'Alexanderplatzviertel' most?

Select collision, count(collision), movement, count(movement), street
from records
group by collision, movement, street
having street = "Alexanderplatzviertel"
order by count(collision), count(movement) desc;

-- 6. Most common accident

select sum(bicycle & car), sum(bicycle & pedestrian), sum(bicycle & motorbike), sum(bicycle & truck), sum(bicycle & other_vehicle), 
	   sum(car & pedestrian), sum(car & motorbike), sum(car & truck), sum(car & other_vehicle),
       sum(pedestrian & motorbike), sum(pedestrian & motorbike), sum(pedestrian & truck), sum(pedestrian & other_vehicle), 
       sum(motorbike & truck), sum(motorbike & other_vehicle),
       sum(truck & other_vehicle)
from records
WHERE car =1;
-- '3405','360','79','118','521','13','7','1','90','0','0','0','1','0','0','4'

-- 7. Grouping by collision

Select collision, count(*), sum(car), hour, count(hour)
From records
group by collision, hour;


Select collision, count(*), sum(car)
From records
group by collision
having car = 1;

-- 8. Road conditions & injury

Select road_conditions, injury, count(*) as injury_count
From records
group by road_conditions, injury
order by road_conditions;

--  9. Light conditions & injury

Select light_conditions, injury, count(*) as injury_count
From records
group by light_conditions, injury
order by light_conditions;


