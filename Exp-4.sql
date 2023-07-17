use rms;
SELECT customer.cust_id,reservation.email from reservation inner join customer on reservation.name = customer.name;
SELECT customer.cust_id,reservation.email from customer left outer join reservation on customer.name = reservation.name union SELECT customer.cust_id,reservation.email from customer right outer join reservation on customer.name = reservation.name;
SELECT customer.cust_id,reservation.email from customer left join reservation on customer.name = reservation.name order by customer.cust_id ;
SELECT reservation.email from reservation right join customer on reservation.name = customer.name;
SELECT * FROM customer WHERE address IN ('Mumbai','Pune') order by cust_id;
SELECT * FROM customer WHERE EXISTS (SELECT * FROM reservation WHERE customer.name = reservation.name);
SELECT name FROM customer WHERE name <> ALL (SELECT name FROM reservation );
SELECT res_id, name FROM reservation WHERE res_id = ANY (SELECT res_id FROM reservation WHERE no_of_ppl = 2 );
