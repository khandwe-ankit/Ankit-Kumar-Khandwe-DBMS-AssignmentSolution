DROP DATABASE IF EXISTS `TravelOnTheGo`;
CREATE DATABASE `TravelOnTheGo` ;
USE `TravelOnTheGo`;

DROP TABLE IF EXISTS `passengers`;
CREATE TABLE `passengers` (
Passenger_name varchar(30),
 Category varchar(30),
 Gender varchar(1),
 Boarding_City varchar(30),
 Destination_City varchar(30),
 Distance int,
 Bus_Type varchar(30));
 
 DROP TABLE IF EXISTS `price`;
 CREATE TABLE `price`(
 Bus_Type varchar(30),
 Distance int,
 Price int);
 
INSERT INTO `passengers` values ('Sejal', 'AC' ,'F', 'Bengaluru', 'Chennai', 350, 'Sleeper');
INSERT INTO `passengers` values ('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700 ,'Sitting');
INSERT INTO `passengers` values ('Pallavi', 'AC', 'F' ,'Panaji', 'Bengaluru', 600 ,'Sleeper');
INSERT INTO `passengers` values ('Khusboo', 'AC', 'F' ,'Chennai', 'Mumbai', 1500 ,'Sleeper');
INSERT INTO `passengers` values ('Udit', 'Non-AC','M', 'Trivandrum' ,'panaji', 1000,'Sleeper');
INSERT INTO `passengers` values ('Ankur', 'AC', 'M', 'Nagpur' ,'Hyderabad', 500 ,'Sitting');
INSERT INTO `passengers` values ('Hemant', 'Non-AC' ,'M' ,'panaji', 'Mumbai' ,700 ,'Sleeper');
INSERT INTO `passengers` values ('Manish', 'Non-AC', 'M' ,'Hyderabad', 'Bengaluru', 500 ,'Sitting');
INSERT INTO `passengers` values ('Piyush' ,'AC', 'M', 'Pune', 'Nagpur', 700 ,'Sitting');

INSERT INTO `price` values ('Sleeper', 350, 770);
INSERT INTO `price` values ('Sleeper' ,500, 1100);
INSERT INTO `price` values ('Sleeper', 600, 1320);
INSERT INTO `price` values ('Sleeper', 700, 1540);
INSERT INTO `price` values ('Sleeper', 1000, 2200);
INSERT INTO `price` values ('Sleeper', 1200, 2640);
INSERT INTO `price` values ('Sleeper', 1500, 2700);
INSERT INTO `price` values ('Sitting', 500, 620);
INSERT INTO `price` values ('Sitting', 600, 744);
INSERT INTO `price` values ('Sitting', 700, 868);
INSERT INTO `price` values ('Sitting', 1000, 1240);
INSERT INTO `price` values ('Sitting', 1200, 1488);
INSERT INTO `price` values ('Sitting', 1500, 1860);


-- Write queries for the following:
-- 3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?
SELECT `passengers`.gender, count(`passengers`.gender) AS `Passenger Count` FROM `passengers` WHERE distance >= 600 GROUP BY `passengers`.gender;


-- 4) Find the minimum ticket price for Sleeper Bus.
SELECT min(`price`.price) AS `Min price of Sleeper Bus` FROM `price` WHERE `bus_type` = "Sleeper";

-- 5) Select passenger names whose names start with character 'S'
SELECT `passengers`.Passenger_name FROM `passengers` WHERE `passengers`.Passenger_name LIKE "S%";

-- 6) Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
SELECT Passenger_name, Boarding_City, Destination_City, `PA`.Bus_Type, price.price FROM `passengers` AS PA LEFT JOIN `price` AS P ON `PA`.distance= `P`.distance 
Inner JOIN `price` ON `PA`.Bus_Type= `price`.Bus_Type;

SELECT `passengers`.Passenger_name, `passengers`.Boarding_City, `passengers`.Destination_City, `passengers`.Bus_Type, `price`.price 
FROM `passengers`, `price` 
where `passengers`.distance = `price`.distance 
AND `passengers`.Bus_Type = `price`.Bus_Type ;

-- 7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus for a distance of 1000 KM s
SELECT `passengers`.Passenger_name, `passengers`.distance, `price`.price 
FROM `passengers`, `price` 
where `passengers`.distance = `price`.distance 
AND `passengers`.Bus_Type = `price`.Bus_Type
AND `passengers`.Bus_Type = "Sitting" 
AND `passengers`.distance = 1000 ;


-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
SELECT `passengers`.Passenger_name, `passengers`.distance, `price`.price, `price`.Bus_Type
FROM `passengers`, `price` 
where `passengers`.distance = `price`.distance 
AND `passengers`.Passenger_name = "Pallavi" ;

-- 9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
SELECT DISTINCT(`passengers`.distance) FROM `passengers` ORDER BY `passengers`.distance DESC;

-- 10) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables
SELECT `passengers`.Passenger_name, ((`passengers`.distance/(SELECT sum(`passengers`.distance) FROM `passengers`))*100) AS `% of total distance` FROM `passengers`;

-- 11) Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap otherwise

SELECT `price`.distance, `price`price,
CASE
WHEN `price`.price  > 1000 THEN "Expensive"
WHEN `price`.price  BETWEEN 500 AND 1000 THEN "Average"
ELSE "Cheap"
END AS `categories`
FROM `price`;
