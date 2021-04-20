drop database if exists create_primary_key;

create database create_primary_key;

use create_primary_key;

create table users (
use_id int auto_increment primary key,
use_name varchar(50),
`password` varchar(30),
email varchar(50)
);

create table roles (
role_id int auto_increment,
role_name varchar(50),
constraint pk_role primary key(role_id)
);

create table users_roles (
use_id int  ,
role_id int  ,
primary key(use_id,role_id),
constraint khoa_phu1 foreign key(use_id) REFERENCES  users(use_id),
 constraint khoa_phu2 foreign key(role_id) REFERENCES  roles(role_id)
);
