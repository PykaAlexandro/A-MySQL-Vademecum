select OrderNbr, Amt, Company, CreditLimit
from Orders, Customers
where Cust = CustNbr;
#joining on customers to have relative informations about orders

select OrderNbr, Amt, Company, CreditLimit, (CreditLimit - Amt)
as CreditLeft 
from Orders, Customers
where Cust = CustNbr;
#with a new column with aliasing

select OrderNbr, Amt, Company, CreditLimit
from Customers inner join Orders
on Customers.CustNbr = Orders.Cust;
#with the SQL92 explicit syntax

select OrderNbr, Amt, Company, Name
from Customers, Orders, SalesReps
where Cust = CustNbr AND CustRep = RepNbr AND Amt >= 25000;
#joining from three tables, three conditions

select OrderNbr, Amt, Company, Name
from Orders inner join Customers on Orders.Cust = Customers.CustNbr 
inner join SalesReps on Customers.CustRep = RepNbr
where Amt > 25000;
#with the SQL92 explicit syntax

create view CustomerOrders as
select CustNbr, Company, Name, OrderNbr, Prod, Qty, Amt
from Orders, Customers, SalesReps
where Cust = CustNbr and CustRep = RepNbr;
#for creating a view, a temporary virtual table for easier later queries
