show databases;
use rms;
show tables;
select * from menu;
select * from customer;
select * from reservation;
select * from orders;
delimiter //
create procedure res_search(in em varchar(30))
begin
select * from reservation where email=em;
end //
delimiter ;
call res_search("abc123@gmail.com") ;

delimiter //
create procedure cust_search(in em varchar(30))
begin
select * from customer where email=em;
end //
delimiter ;
call cust_search("abc123@gmail.com") ;
