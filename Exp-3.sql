show databases;
use rms;
show tables;
select * from menu;
select * from menu where id >5;
select * from menu where name like "G%" and price>100;
select * from menu where code not like "%5" or id!=5;
select * from menu where id in (2,5,7) or id not in (1,3,4,6,8,9,10);
select * from menu where price between 100 and 200 ;
select * from menu where description is not null;
select * from menu where description is null;
select * from menu group by description="Pizza";
select * from menu order by id desc;
select min(price), name, description from menu ;
select max(id), name , description from menu ;
select count(name) from menu where description="Pizza";
select count(name), description from menu group by description;
select count(name), description from menu group by description having description in ("Bread","Pizza");
select sum(price) from menu where description="Pizza";
select avg(price) from menu where description="Bread";
select * from customer;
select * from reservation;
select * from customer union select * from reservation;
select * from customer union all select * from reservation;
select * from reservation where email in (select email from customer);
select CURRENT_TIMESTAMP as CurrentServerDateTime;
select DATE_ADD('2000/11/03',interval 5 day) as Result;
select DATEDIFF('2000/10/21','2002/09/25');
select ascii("a"), ascii("A");
select insert("Hello , How are you ?",7,0,"guys");
select insert("Hello , How are you ?",7,4,"guys");
select instr("Hello World!","Wor");