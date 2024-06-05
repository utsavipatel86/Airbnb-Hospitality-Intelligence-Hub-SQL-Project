show databases;
use airbnb_hospitality;

show tables;

select * from listings l ;
select * from newtable n ;

alter table newtable rename to booking_details;
select * from booking_details ;

select * from listings;
select * from booking_details ;

select name from listings l ; #2

select count(id) from listings l ;#3

select count(listing_id) from booking_details bd ;#4

select count(host_id) from listings l ;#5

select distinct(host_name) from listings l ;#6

select distinct(neighbourhood_group) from listings l ;#7

select distinct(neighbourhood) from listings l ;#8

select distinct (room_type) from listings l ;#9

select * from listings l where neighbourhood_group in ('Brooklyn', 'Manhattan');#10

select max(price) from booking_details bd ;#11

select min(price) from booking_details bd ;#12

select avg(price) from booking_details bd ;#13

select min(minimum_nights) from booking_details bd ;#14

select max(minimum_nights) from booking_details bd ;#15

select avg(availability_365) from booking_details bd ;#16

select listing_id, availability_365 from booking_details bd where availability_365>300;#17

select count(listing_id) from  booking_details bd  where price between 300 and 400;#18

select count(minimum_nights) from booking_details bd where minimum_nights<5;#19

select count(minimum_nights) from booking_details bd where minimum_nights>100;#20

select l.*, bd.*
from listings l left join booking_details bd 
on id=listing_id
union 
select l.*, bd.*
from listings l right join booking_details bd 
on id=listing_id;
#or
select * from listings inner join booking_details on listings.id = booking_details.listing_id; #21

select l.host_name, bd.price
from listings l inner join booking_details bd 
on l.id= bd.listing_id;
#or
select l.host_name, bd.price
from listings l inner join booking_details bd 
on id= listing_id;#22

select l.room_type, bd.price
from listings l inner join booking_details bd 
on id= listing_id;#23

select l.neighbourhood_group, bd.minimum_nights
from listings l inner join booking_details bd 
on id=listing_id;#24

select l.neighbourhood, bd.availability_365
from listings l inner join booking_details bd 
on id= listing_id;#25

select sum(bd.price), l.neighbourhood_group
from listings l inner join booking_details bd 
on id=listing_id
group by l.neighbourhood_group;#26

select max(bd.price), l.neighbourhood_group
from listings l inner join booking_details bd 
on id= listing_id
group by l.neighbourhood_group;#27

select max(bd.minimum_nights) , l.neighbourhood_group
from listings l inner join booking_details bd 
on id= listing_id
group by l.neighbourhood_group; #28

select max(bd.reviews_per_month) , l.neighbourhood
from listings l inner join booking_details bd 
on id=listing_id
group by l.neighbourhood;#29

select max(bd.price), l.room_type
from listings l inner join booking_details bd 
on id=listing_id
group by l.room_type; #30

select avg(bd.number_of_reviews), l.room_type
from listings l inner join booking_details bd 
on id=listing_id
group by l.room_type;#31

select avg(bd.price), l.room_type
from listings l inner join booking_details bd 
on id= listing_id
group by l.room_type;#32

select avg(bd.minimum_nights), l.room_type
from listings l inner join booking_details bd 
on id= listing_id
group by l.room_type;#33

select avg(bd.price) avg_price, l.room_type
from listings l inner join booking_details bd 
on id= listing_id
group by l.room_type
having avg_price<100 ;#34

select avg(bd.minimum_nights) as avg_nights, l.neighbourhood
from listings l inner join booking_details bd 
on id= listing_id
group by l.neighbourhood
having avg_nights>5 ;#35

select * from listings l  where id in (select id from booking_details bd2 where price >200); #36

select * from booking_details bd where listing_id in (select listing_id from listings l where host_id = 314941); #37

select distinct l1.id , l1.host_id from listings l1, listings l2
where  l1.host_id = l2.host_id and l1.id  <> l2.id  order by host_id; #38

select * from listings l where name like '%cozy%'; #39

select bd.price, l.host_id, l.neighbourhood_group
from listings l inner join booking_details bd 
on id=listing_id
where neighbourhood_group='Manhattan'; #40

select l.id, l.host_name, l.neighbourhood, bd.price
from listings l inner join booking_details bd 
on id=listing_id
where neighbourhood in ('Upper West Side', 'Williamsburg') and price >100; #41

select l.id, l.host_name, l.neighbourhood, bd.price
from listings l inner join booking_details bd 
on id=listing_id
where host_name= 'Elise' and neighbourhood = 'Bedford-Stuyvesant'; #42

select l.host_name, bd.availability_365,bd.minimum_nights
from listings l inner join booking_details bd 
on id=listing_id
where availability_365>100 and minimum_nights>100; #43

select l.id, l.host_name, bd.number_of_reviews, bd.reviews_per_month
from listings l inner join booking_details bd 
on id=listing_id
where number_of_reviews>500 and reviews_per_month>5; #44

select l.neighbourhood_group, sum(bd.number_of_reviews) total_reviews
from listings l inner join booking_details bd 
on id=listing_id
group by l.neighbourhood_group
order by total_reviews desc 
limit 1; #45

select l.host_name, sum(bd.price) total_price
from listings l inner join booking_details bd 
on id=listing_id
group by l.host_name
order by total_price 
limit 1; #46

select l.host_name, sum(bd.price) total_price
from listings l inner join booking_details bd 
on id=listing_id
group by l.host_name
order by total_price  desc
limit 1; #47

select l.host_name ,bd.price
from listings l inner join booking_details bd 
on id = listing_id
where bd.price in (select max(price) from booking_details); #48

select l.neighbourhood_group, bd.price
from listings l inner join booking_details bd 
on id=listing_id
where price<100; #49

select l.room_type, max(bd.price) max_price, avg(availability_365) avg_availability365
from listings l inner join booking_details bd 
on id=listing_id
group by l.room_type
order by max_price;#50





