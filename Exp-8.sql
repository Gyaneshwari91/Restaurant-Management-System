show databases;
use rms;
show tables;
desc customer;
select * from menu;
select * from customer;
select * from reservation;
select * from orders;

create view menu_view as select name, code, price, description from menu;
select * from menu_view;
alter view menu_view as select * from menu;
select * from menu_view;
drop view menu_view;

create view visit_details as select cust_id, customer.email, phone, reservation.vip_id, reservation.res_date, reservation.no_of_ppl from customer, reservation where customer.email=reservation.email;
select* from visit_details;
drop view visit_details;