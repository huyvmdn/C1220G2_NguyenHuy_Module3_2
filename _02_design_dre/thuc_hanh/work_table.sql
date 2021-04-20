drop database if exists working_table;

create database working_table;

use working_table;

create table contacts (
	contact_id int(11) not null auto_increment,
    day_of_birth date,
    constraint contact_pk primary key(contact_id)
);

create table suppliers (
supplier_id int(11) not null auto_increment,
supplier_name varchar(50) not null,
account_rep varchar(30) not null default 'TDB',
constraint supplier_pk primary key (supplier_id)
);

-- drop table contacts, suppliers;

    
alter table contacts
  add last_name varchar(40) not null
    after contact_id,
  add first_name varchar(35) null
    after last_name;

alter table contacts
	modify last_name varchar(50) not null
     ;

-- alter table contacts
-- 	drop column day_of_birth;
    
alter table contacts
change column last_name `name` varchar(50) not null;

alter table contacts
rename con_nguoi;





