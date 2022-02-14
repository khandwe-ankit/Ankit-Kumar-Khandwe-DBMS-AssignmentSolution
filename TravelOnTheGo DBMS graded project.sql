DROP DATABASE IF EXISTS `TravelOnTheGo`;
CREATE DATABASE `TravelOnTheGo` ;
USE `TravelOnTheGo`;

CREATE TABLE `passengers` (
Passenger_name varchar(30),
 Category varchar(30),
 Gender varchar(1),
 Boarding_City varchar(30),
 Destination_City varchar(30),
 Distance int,
 Bus_Type varchar(30));
 
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
