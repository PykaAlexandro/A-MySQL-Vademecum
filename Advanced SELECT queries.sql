select *
from Offices
where State in ('CO', 'TX', 'UT');

select *
from SalesReps
where Quota between 50000 and 100000;

select *
from SalesReps
where Quota not between 50000 and 100000;
#using logical constraints

select Name
from SalesReps
where Quota is null;

select Name
from SalesReps
where Quota is not null;
#with null values only the is/is not syntax works

select Cust, count(*)
from Orders
group by Cust;
#to know how many orders each customer made with the GROUP_BY clause (to be used after an aggregation like COUNT, SUM or MAX)

select Vendor, count(*)
from Parts
group by Vendor
having count(*) > 2;
#if we want to subset the results of a GROUP_BY clause, we need to use the HAVING one after it (WHERE will not work)

select *
from Customers
order by CreditLimit desc;

select *
from Customers
order by CreditLimit desc, CustRep asc;
#using the ORDER_BY clause, with ascending and descending options

select *
from Salesreps
order by Name asc
limit 1;
#to select the first sales representative in alphabetical order, with OFFSET n we can start from the nth row

select *
from Offices
order by rand()
limit 1;
#a way to perform a casual sample from a table

select rand();
#to cast a random number

select Name, Sales, Quota, (Sales - Quota)
as Difference
from SalesReps;
#creating a new column from two existing ones with aliasing

select Name, Sales, Quota, (Sales - Quota) 
as Difference
from SalesReps
where Sales < Quota;
#looking for sales representatives with a bad selling performance