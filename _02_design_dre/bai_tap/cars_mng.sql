drop database if exists quan_ly_xe;

create database quan_ly_xe;

use quan_ly_xe;

create table offices (
officeCode varchar(10)  primary key,
city varchar(50) not null,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50) not null,
state varchar(50) not null,
country varchar(50) not null,
postalCode varchar(15) not null);

create table employees (
	employeeNumber int  primary key,
    lastName varchar(50) not null,
    firstName varchar(50) not null,
    email varchar(100) not null,
    jobTitle varchar(50) not null,
    officeCode VARCHAR(10) NOT NULL,
	reportTo text NOT NULL,
    managerNumber int NOT NULL,
	foreign key (officeCode) references offices (officeCode),
	foreign key (managerNumber) references employees (employeeNumber)
);



create table customers (
customerNumber int primary key,
customerName varchar(50) not null,
contactLastName varchar(50) not null,
contactFirstName varchar(50) not null,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50) ,
city varchar(50) not null,
state varchar(50) not null,
postalCode varchar(15) not null,
country varchar(50) not null,
creditLimit double not null,
employeeNumber int not null,
 foreign key  (employeeNumber) references employees (employeeNumber)
);

create table orders (
orderNumber int primary key,
orderDate date not null,
requiredDate date not null,
shippedDate date not null,
`status` varchar(15) not null,
comments text,
quantityOrdered int not null,
priceEach  double not null,
customerNumber  int(15) not null ,
foreign key (customerNumber) references Customers(customerNumber)
);



create table payments (
customerNumber int(15) not null ,
checkNumber varchar(50) not null primary key,
paymentDate date not null,
amount double not null,
foreign key (customerNumber) references Customers(customerNumber)
);

create table productlines   (
productLine varchar(50) primary key,
textDescription text ,
image  varchar(255) );



create table products  (
productCode varchar(15) primary key,
productName varchar(70) not null,
productScale varchar(10) not null,
productVendor varchar(50) not null,
productDescription text not null,
quantityInStock int not null,
buyPrice double not null,
MSRP double not null,
productLine varchar(50) not null,
constraint productlines_productLine foreign key (productLine) references productlines(productLine)
);

create table OrderDetails (
productCode varchar(15) not null,
orderNumber int not null,
primary key (productCode,orderNumber),
foreign key (productCode) references products(productCode),
foreign key (orderNumber) references orders(orderNumber)
);








