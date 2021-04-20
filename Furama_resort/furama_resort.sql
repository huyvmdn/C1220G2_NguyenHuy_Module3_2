drop database if exists Furama_resort;

create database Furama_resort;

use Furama_resort;

create table position (
	position_id int primary key,
    position_name varchar(255) not null
);

create table education_degree (
	education_degree_id int primary key,
    education_degree_name varchar(255) not null
);

create table division (
	division_id int primary key,
	division_name varchar(255) not null
);

create table `role` (
	role_id int primary key,
	role_name varchar(255) not null
);

create table `user` (
	username varchar(255) primary key,
    password varchar(255) not null
);

create table user_role (
	username varchar(255),
    role_id int  ,
    primary key (username,role_id),
    foreign key (username) references `user` (username) on update cascade on delete cascade,
    foreign key (role_id) references `role` (role_id) on update cascade on delete cascade
);

create table attach_service (
	attach_service_id int primary key,
	attach_service_name varchar(255) not null,
	attach_service_cost double not null,
	attach_service_unit int not null,
	attach_service_status varchar(255) 
);


create table customer_type (
customer_type_id int primary key,
customer_type_name varchar(255) 
);

create table customer(
customer_id int primary key auto_increment,
customer_type_id int not null,
customer_name varchar(255) not null,
customer_birthday date not null,
customer_gender int not null,
customer_id_card varchar(255) not null,
customer_phone varchar(255) not null,
customer_email varchar(255),
customer_address varchar(255),

foreign key (customer_type_id) references customer_type (customer_type_id) on update cascade on delete cascade
);


create table service_type (
	service_type_id int primary key,
    service_type_name varchar(255)  not null
);


create table rent_type (
rent_type_id int primary key ,
rent_type_name varchar(255) not null,
rent_type_cost double not null
);


create table service (
service_id int primary key,
service_name varchar(255) not null,
service_area int ,
service_cost double not null,
service_max_people int ,
rent_type_id int ,
service_type_id int,
standard_room varchar(255),
description_other_convenience varchar(255),
pool_area double,
number_of_floors int


);

create table employee (
employee_id int primary key,
employee_name varchar(255) ,
employee_birthday date,
employee_id_card varchar(255),
employee_salary double,
employee_phone varchar(255),
employee_email varchar(255),
employee_address varchar(255),
position_id int,
education_degree_id int,
division_id int,
username varchar(255),

foreign key (position_id) references position (position_id) on update cascade on delete cascade,
foreign key (education_degree_id) references education_degree (education_degree_id) on update cascade on delete cascade,
foreign key (division_id) references division (division_id) on update cascade on delete cascade,
foreign key (username) references `user` (username) on update cascade on delete cascade
);

alter table service
add foreign key  (rent_type_id) references rent_type (rent_type_id),
add foreign key  (service_type_id) references service_type (service_type_id);

create table contract (
contract_id int primary key,
contract_start_date datetime,
contract_end_date datetime,
contract_deposit double,
contract_total_money double,
employee_id int,
customer_id int,
service_id int,

foreign key (employee_id) references employee(employee_id) on update cascade on delete cascade,
foreign key (customer_id) references customer(customer_id) on update cascade on delete cascade,
foreign key (service_id) references service(service_id) on update cascade on delete cascade
);

create table contract_detail (
contract_detail_id int primary key,
contract_id int ,
attach_service_id int,
quatity int,

foreign key  (contract_id) references contract(contract_id) on update cascade on delete cascade,
foreign key  (attach_service_id) references attach_service(attach_service_id) on update cascade on delete cascade
);



