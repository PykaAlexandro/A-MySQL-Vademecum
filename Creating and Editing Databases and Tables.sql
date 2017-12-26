drop database if exists SQL_Playground;
create database SQL_Playground;
use SQL_Playground;
#to create a database named SQL_Playground

create table Offices (
OfficeNbr nchar (2) not null primary key,
City nvarchar (20) not null,
State nchar (2) not null,
Region nchar (5) not null,
Target decimal (10,2) not null,
Sales decimal (10,2) not null,
Phone nvarchar (15) not null);

create table SalesReps (
RepNbr nchar (3) not null primary key,
Name nvarchar (20) not null,
RepOffice nchar (2) not null,
Quota decimal (10,2),
Sales decimal (10,2) not null,
foreign key (RepOffice)
references Offices(OfficeNbr) );

create table Customers (
CustNbr nchar (3) not null primary key,
Company nvarchar (30) not null,
CustRep nchar (3) not null,
CreditLimit decimal (10,2) not null,
foreign key (CustRep)
references SalesReps(RepNbr) );

create table Orders (
OrderNbr int not null primary key auto_increment,
Cust nchar (3) not null,
Prod  nvarchar (20) not null,
Qty int not null,
Amt decimal (10,2) not null,
Disc decimal (3,1) not null,
foreign key (Cust)
references Customers(CustNbr) );

create table Employees (
EmpNbr nchar (5) not null primary key,
Name nvarchar (20) not null,
Title nvarchar (20) not null,
Mgr nchar (5) );

create table Parts (
PartId  nchar (4)  not null primary key,
Vendor nchar (4) not null);
#creating various tables

insert into Offices
values ('1', 'Denver', 'CO', 'West', '3000000', '130000', '970.586.3341');

insert into Offices
values ('2', 'New York', 'NY', 'East', '200000', '300000', '212.942.5574');

insert into Offices
values ('57', 'Dallas', 'TX', 'West', '0', '0', '214.781.5342');

insert into SalesReps
values ('53', 'Bill Smith', '1', '10000', '0');

insert into SalesReps
values ('89', 'Jen Jones', '2', '50000', '130000');

insert into Customers
values ('211', 'Connor Co', '89', '50000');

insert into Customers
values ('522', 'Amaratunga Enterprises', '89', '40000');

insert into Customers
values ('890', 'Feni Fabricators', '53', '1000000');

insert into Orders (Cust, Prod, Qty, Amt, Disc)
values ('211', 'Bulldozer', 7, 31000, 0.2);

insert into Orders (Cust, Prod, Qty, Amt, Disc)
values ('522', 'Riveter', 2, 4000, 0.3);

insert into Orders (Cust, Prod, Qty, Amt, Disc)
values ('522', 'Crane', 1, 500000, 0.4);
#populating the table (if we specify the field we can use the order we like)

insert into Offices (OfficeNbr, City, State, Region, Target, Sales, Phone)
values ('55', 'Dallas', 'TX', 'West', 200000, 0, '214.333.2222');
#if we wish to insert a new Office into the Offices table

update Offices
set Target = 300000
where OfficeNbr = '55';
#to update the value of a variable

delete from Offices
where OfficeNbr = '55';
#to delete a row in the Offices table

create table CustomersBackup2017
as (select *
from Customers);
#we can create a backup with the AS operand

create table CustomersBackup2017
as (select CustNmr, Company
from Customers);

create table Regions
as (select Region, count(*)
    from Offices
    group by Region);
#selecting only certain columns

select CustNbr, Company
into CustomersBackup2017
from Customers;
#another syntax