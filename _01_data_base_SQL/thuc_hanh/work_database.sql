select *
from customers
where customername like 'Atelier graphique';

select *
from customers
where customername like '%A%';

select *
from customers
where city 
in('Nantes', 'Las Vegas', 'Warszawa', 'NYC')
limit 0,30;

select *
from orders
where ordernumber 
in (10100, 10110);

select *
from orders
where orderDate <= '2003-03-03'
	 and `status`  like 'shipped';
     