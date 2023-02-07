CREATE DATABASE lab_mysql;
USE lab_mysql;

Create table Cars (
	vehicle_id int,
    name_manufacturer varchar (255),
    model varchar(255),
    year date,
    color varchar(255)
);

alter table Cars 
ADD Primary key (vehicle_id);


Create table Salespersons (
	staff_id int,
    name varchar (255),
    store varchar(255)
);

alter table Salespersons 
ADD Primary key (staff_id);

Create table Customers (
	customer_id int,
    name varchar (255),
    phone_number bigint (16),
    email varchar (255),
    address varchar (255),
    city varchar (255),
    state_province varchar (255),
    country varchar (255), 
    postal_code varchar (255),
    Primary key (customer_id)
);

Create table Invoices (
	invoice_number int,
	vehicle_id varchar (255),
    customer_id varchar (255),
    staff_id varchar (255),
    date date,
    Primary key (invoice_number),
    Foreign key (vehicle_id) references Cars(vehicle_id),
    Foreign key (customer_id) references Customers(customer_id),
    Foreign key (staff_id) references Salespersons(staff_id)
);

alter table Cars 
ADD id int; 

alter table Customers 
ADD id int; 

alter table Invoices 
ADD id int; 

alter table Salespersons 
ADD id int; 
