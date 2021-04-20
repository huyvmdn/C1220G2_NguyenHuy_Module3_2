use classicmodels;

SELECT * FROM customers WHERE customerNumber = 175; 

EXPLAIN SELECT * FROM customers WHERE customerNumber = 175;

alter table customers add index idx_full_name(contactFirstName, contactLastName);
explain select *
from customers
WHERE contactFirstName = 'Jean' or contactFirstName = 'King';