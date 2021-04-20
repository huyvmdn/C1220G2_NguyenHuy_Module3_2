drop database if exists Products;

create database Products;

use Products;



create table Products (
Id int primary key,
productCode int,
productName varchar(50) not null,
productPrice double not null,
productAmount int not null,
productDescription text not null,
productStatus varchar(50)
);

 create Unique index  idx_productCode 
 on Products (productCode);

 create index  name_price 
on Products (productName,productPrice);

insert into Products
values
(1,1,'samsung',100,20,' khong y kien',' not ivalable');

explain select *
from products;

create view display_products
as
select productCode, productName, productPrice, productStatus
from products;

UPDATE display_products
   SET productCode = 35
   WHERE productName = 'nokia';

drop view display_products;

delimiter //
create procedure display_products ()
begin
select *
from Products;

end;
// delimiter ;

call display_products()

delimiter //
create procedure insert_products (Id int,productCode int,productName varchar(50),productPrice double,productAmount int,productDescription text,productStatus varchar(50))
begin
insert into Products
values
(Id,productCode,productName,productPrice,productAmount,productDescription,productStatus);

end;
// delimiter ;

call insert_products(2,3,'iphone',70,30,' khong y kien',' not ivalable')


delimiter //
create procedure update_products (id int )
begin
UPDATE products
SET productName= 'Xoa ten'
WHERE id;

end;
// delimiter ;

call update_products(1);

select *
from products;

delimiter //
create procedure delete_products (id int )
begin
delete from products
WHERE id;

end;
// delimiter ;

call delete_products(1);

select *
from products;

