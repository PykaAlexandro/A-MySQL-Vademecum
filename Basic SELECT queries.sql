select *
from Offices;
#to select all rows and columns from Offices table

select distinct Region
from Offices;
#to list all the different regions there are

select City
from Offices;
#to select a specific column

select count(*)
from Orders
where Cust = '211';
#to count all the orders made by a customer

select max(Amt)
from Orders;
#to select the order with the highest monetary value

select avg(Amt)
from Orders
where Cust = '211';
#to return the mean monetary value of all orders made by a specific customer 

select avg(Amt)
from Orders
where not Cust = '211';
#with not we exclude that customer

select OfficeNbr, Phone
from Offices
where Phone like '21%';
#using a SQL wildcard to return all telephone numbers starting with 21

select OfficeNbr, Phone
from Offices
where Phone not like '21%';
#to return telephone numbers not starting with 21

select OfficeNbr, Phone
from Offices
where Phone regexp '21[1-2]';
#using a MySQL wildcards, it returns the telephone numbers starting with 21 and with the third digit either 1 or 2