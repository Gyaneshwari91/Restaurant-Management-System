show databases;
use rms;
show tables;
desc customer;
select * from menu;
select * from customer;
select * from reservation;
select * from orders;
drop table updatelist;
select * from updatelist;
create table updatelist(sno int ,time datetime,updates varchar(20));
insert into updatelist values(1,"2000-09-08","updated !");

delimiter //
drop procedure if exists setupdates //
create procedure setupdates(in X char)
begin
update updatelist set Time=now(), updates="Updated !" where sno=1 ;
end //
delimiter ; 

delimiter //
drop trigger if exists cust_add //
create trigger cust_add
after insert on customer for each row
begin
 call setupdates('A');
end //
delimiter ;

show triggers ;

delimiter //
drop trigger if exists menu_upd //
create trigger menu_upd
after update on menu for each row
begin
 call setupdates('A');
end //
delimiter ;

delimiter //
drop trigger if exists res_del //
create trigger res_del
after delete on reservation for each row
begin
 call setupdates('A');
end //
delimiter ;
update menu set price=107 where id=1;
delete from reservation where email="aagg@gmail.com";