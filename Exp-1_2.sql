create database rms;
use rms;

create table customer (cust_id int(11), name varchar(50),email varchar(50),password varchar(50), address varchar(50), phone bigint(20),vip_id int(11));
desc customer;
alter table customer modify name varchar(50) not null;
alter table customer modify cust_id int(11) not null;
alter table customer modify email varchar(50) not null;
alter table customer modify password varchar(50) not null;
alter table customer modify address varchar(50) not null;
alter table customer modify phone bigint(20) not null;
alter table customer modify cust_id int(11) auto_increment unique key; 
alter table customer modify email varchar(50) primary key; 

create table menu (id int (8), name varchar(255),code varchar(255),image text, price double(10,2),description varchar(255));
desc menu;
alter table menu modify id int(8) auto_increment primary key ;
alter table menu modify code varchar(255) unique key; 
alter table menu modify name varchar(255) not null;
alter table menu modify code varchar(255) not null; 
alter table menu modify description varchar(255) not null;
alter table menu modify image text not null;
alter table menu modify price double(10,2) not null;

create table  orders(id int(11), email varchar(50) , ord_date date , code varchar(110), quantity int(11), ord_time time , total int(11));
alter table orders modify id int(11) auto_increment primary key ;
desc orders;
alter table orders add foreign key(email) references customer(email);
alter table orders modify email varchar(50) not null;
alter table orders modify ord_date date not null;
alter table orders modify code varchar(110) not null;
alter table orders modify quantity int(11) not null;
alter table orders modify ord_time time not null;
alter table orders modify total int(11) not null;
alter table orders add foreign key(code) references menu(code);
select * from orders;

create table reservation(res_id int(11) not null, res_date date not null , email varchar(50) not null , vip_id int(11) , res_time time not null , no_of_ppl int(11) not null);
desc reservation;
alter table reservation modify res_id int(11) auto_increment primary key ;
alter table reservation add foreign key(email) references customer(email);
alter table reservation add column name varchar(50) after res_id;
alter table reservation modify name varchar(50) not null;

insert into menu(name,code,image,price,description)values('French Fries', 'dish-1','name of image',106,'Fries');
insert into menu(name,code,image,price,description)values('Chilli Cheese Toast', 'dish-2','name of image',115,'Bread'),('Garlic Bread', 'dish-3','name of image',98,'Bread'),('Garlic Bread with Cheese', 'dish-4','name of image',119,'Bread'),('Grilled Sandwich', 'dish-5','name of image',175,'Sandwich'),('Veg Burger', 'dish-6','name of image',72,'Burger'),('Plain Cheese Pizza', 'dish-7','name of image',190,'Pizza');
insert into menu(name,code,image,price,description)values('Golden Corn Pizza','dish-8','name of image',340,'Pizza'),('Margherita Pizza','dish-9','name of image',230,'Pizza'),('Classic Veggie Pizza','dish-10','name of image',280,'Pizza');
insert into menu(name,code,image,price,description)values('Gulab Jamun','dish-11','name of image',60,'Dessert'),('Hot chocolate fudge','dish-12','name of image',165,'Sundae');
insert into menu(name,code,image,price,description)values('Fruit salad sundae','dish-13','name of image',165,'Sundae');
update menu set description='Toast' where id=2;
update menu set price=106 where id=3;
SET SQL_SAFE_UPDATES = 0;
delete from menu where id = 13;


select* from menu;
SELECT id, name FROM menu; 
SELECT DISTINCT price FROM menu;
SELECT * FROM menu ORDER BY price;
SELECT * FROM menu ORDER BY price desc;
SELECT COUNT(id),description FROM menu GROUP BY description; 
SELECT COUNT(id),description FROM menu GROUP BY description HAVING COUNT(id)>1 ORDER BY price DESC; 
select min(price) from menu;
select max(price) from menu;
SELECT COUNT(id) FROM menu;
SELECT sum(price)FROM menu;
SELECT avg(price)FROM menu;
SELECT * FROM menu WHERE description ='Pizza' AND price > 200; 
SELECT * FROM menu WHERE description = 'Pizza' OR description = 'Bread' ;
SELECT * FROM menu WHERE NOT description='Pizza';
SELECT * FROM menu WHERE price BETWEEN 150 AND 250; 
SELECT * FROM menu WHERE name LIKE 'G%';
SELECT * FROM menu WHERE description IN ('Bread','Dessert','Fries');
SELECT id,name,price FROM menu WHERE price is null; 
SELECT id,name,price FROM menu WHERE price is not null; 
SELECT CURRENT_TIMESTAMP AS CurrentServerDateTime;
SELECT DATE_ADD('2022/10/11',interval 10 day) AS Result;

-- String Functions
/*
SELECT ASCII('S');
SELECT INSERT ('helloWorld',4,4,'byee');
SELECT INSTR('foobarbar','bar');
SELECT LCASE('STUDENT');
SELECT LENGTH('PUNE');*/

-- For set operations:

SELECT* FROM customer ;
insert into customer(name,email,password,address,phone)values('Abhishek','xyz@gmail.com',5678,'Pune',999346678);
insert into customer(name,email,password,address,phone)values('Shubha','abs7867@gmail.com',3003,'Pune',8345678948);
insert into customer(name,email,password,address,phone)values('Shiva','abc123@gmail.com',123456,'Pune',923466780);
insert into customer(name,email,password,address,phone)values('Abhinav','aagg@gmail.com',123456,'Pune',928866780);

insert into reservation(name,res_date,email,res_time,no_of_ppl)values('Snehal','2022/10/4','abc123@gmail.com','4:50:11',4);
insert into reservation(name,res_date,email,res_time,no_of_ppl)values('Shubha','2022/10/6','abs7867@gmail.com','6:30:30',2);
insert into reservation(name,res_date,email,res_time,no_of_ppl)values('Ruchi','2022/10/8','xyz@gmail.com','8:50:30',8);
insert into reservation(name,res_date,email,res_time,no_of_ppl)values('Shailesh','2022/10/15','aagg@gmail.com','3:00:00',2);


SELECT name,email FROM customer  UNION SELECT name,email FROM reservation;
SELECT * FROM customer WHERE name IN (SELECT name  FROM reservation); 
SELECT * FROM customer WHERE name NOT IN (SELECT name FROM reservation);