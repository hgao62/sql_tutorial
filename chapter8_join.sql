--Chapter 8 Join

--8.1 inner join
select p.productname,p.unitprice,s.companyname as supplier_name
from products as p  inner join suppliers as s -- put tables you want to join here
on p.supplierid=s.supplierid -- join on the columns that have matching values on both table

--8.2 self join(inner join)": find employee's manager. Very common interview question!!
select e.empid, e.firstname || ' '  || e.lastname as emp,
     m.firstname || ' ' || m.lastname as mgr
from employees as e inner join employees as m
on e.mgrid=m.empid

-- verify query above
select *
from employees
where empid in ('1','2')


--8.3 left join: keep all records from left table( 保留左边table的所有records)

SELECT 
    c.customerid,
    c.name,
    c.address,
    o.order_id,
    o.product,
    o.amount
FROM 
    customers c
LEFT JOIN 
    orders o 
ON 
    c.customerid = o.customer_id;
    
--8.4 Difference between AND and WHERE in outer join


SELECT s.supplierid,s.companyname AS supplier_name,s.country,p.productname,p.unitprice
FROM  suppliers AS s  
LEFT JOIN  products AS p 
ON p.supplierid=s.supplierid
and s.country= 'Japan'


SELECT s.supplierid,s.companyname AS supplier_name,s.country,p.productname,p.unitprice
FROM  suppliers AS s  LEFT JOIN  products AS p 
ON p.supplierid=s.supplierid
WHERE s.country= 'Japan'


--8.5 right join
SELECT c.customerid,c.name,c.address,o.order_id,o.product,o.amount
FROM customers c
RIGHT JOIN 
    orders o 
ON 
    c.customerid = o.customer_id;
    

SELECT c.customerid,c.name,c.address,o.order_id,o.product,o.amount
FROM 
    customers c
full outer JOIN 
    orders o 
ON 
    c.customerid = o.customer_id;

--8.6 multi join


SELECT S.companyname AS supplier, S.country,
	P.productid, P.productname, P.unitprice,
	C.categoryname
FROM Suppliers AS S
INNER JOIN Products AS P
ON S.supplierid = P.supplierid
INNER JOIN Categories AS C
ON C.categoryid = P.categoryid
WHERE S.country = 'Japan';

