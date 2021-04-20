select customerName,phone,city, country
from customers
where customername like '%%';

select *
from customers;

select *
from customers
where customerName = 'Atelier Graphique';

select * 
from customers 
where customername like '%Australian%';

select *
from customers
where city
in( 'Nantes', 'Las Vegas', 'Warszawa', 'NYC');


