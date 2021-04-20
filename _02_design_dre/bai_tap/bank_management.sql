drop database if exists quan_ly_tai_khoan_ngan_hang;

create database quan_ly_tai_khoan_ngan_hang;

use quan_ly_tai_khoan_ngan_hang;

create table emails (
id int primary key unique not null,
email varchar(50)
);
create table account_type_id (
id int primary key unique not null ,
account_type varchar(15)  default 'Normal'
);

create table Transactions (
tran_number int(15) not null unique,
account_number int(15) not null unique,
`date` date,
amounts int(50) not null,
descriptions varchar(255)
);

create table Accounts  (
	account_number int(15) not null unique,
    account_type_id int(15) not null ,
    `date` date ,
    balance bigint,
    constraint account_type_id foreign key (account_type_id) references account_type_id(id),
    primary key (account_number)
);


create table Customers (
customer_number int(15) not null unique,
fullname  varchar(50) not null,
address  varchar(50)  not null,
email_id int  not null,
phone int(10) unique not null,
account_number int(15) not null unique,


constraint Accounts_account_number foreign key (account_number) references Accounts(account_number),
constraint Transactions_account_number foreign key (account_number) references Transactions(account_number),
constraint emails_id foreign key (email_id) references emails(id),
primary key (customer_number)
);







