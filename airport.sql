create database airline;
use airline
create table Passenger(P_id int(10) NOT NULL,
p_name varchar(255) not null,
p_age int(10), gender varchar(255),



p_gender varchar(10),
primary key(p_id));





create table flight(f_id int NOT NULL,
f_name varchar(200),No_seats int(10),Checkin datetime,
source varchar(255),
destination varchar(255),
check(No_seats<=10),primary key(f_id));





create table ticket(T_id int(10),passenger_name varchar(100),
Passenger_id int(10),Flight_id int(10),
Seat_no int(10),Price_in_Rs int(10),
foreign key(P_id) references Passenger(Passenger_id),
foreign key(Flight_id) references flight(flight_id));







insert into Passenger (P_id,p_name,p_age,p_gender)
values (001,'shashank',25,'Male'), (002,'Mallikarjun',25,'Male'),
(003,'Rishi',30,'Male'), (004,'Arohi',24,'Female');





insert into flight values(11,'indigo',1,'2022-06-12 11:00:00','blore','delhi');
insert into flight values(12,'gofirst',2,'2022-07-22 13:30:00','blore','mumbai');
insert into flight values(13,'gofirst',3,'2022-01-26 03:30:00','blore','hyderabad');
insert into flight values(14,'indigo',4,'2022-03-26 04:30:00','blore','mumbai');
insert into flight values(15,'spicejet',5,'2022-05-21 04:00:00','blore','chennai');
insert into flight values(16,'spicejet',6,'2022-08-08 07:00:00','blore','delhi');






insert into ticket values(101,'Rishi',3,11,1,10000);
insert into ticket values(102,'anisha',5,13,2,11000);
insert into ticket values(103,'shashank',4,14,5,11500);
insert into ticket values(104,'Mallikarjun',2,15,3,9500);
insert into ticket values(105,'shashank',1,12,4,8000);
insert into ticket values(106,'Rishi',3,14,2,7000);






create view Boarding_details as select f_id as Flight_ID,
fname as Flight_Name,Checkin,Source, destination,
Price_in_Rs as Price from flight,
ticket where f_id=flight_id






create View Customer_Details as select P_Id,p_name,p_age,p_gender
F_id,F_name ,Seat_no,source,
destination,Checkin from Passenger,flight,
ticket where F_id=Flight_id and P_id=Passenger_id;






Create view Flight_Revenue as select f_name,
f_id,Price_in_Rs * count(flight_id) as revenue from flight,
ticket where F_id=flight_id group by f_id;






Create view Flight_Revenue1 as select f_name,
Ft_Id,sum(Price_in_Rs) as revenue from flight,
ticket where F_id=flight_id group by f_id;