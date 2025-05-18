--Chapter 8 Join(连接数据)

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


---Exercise

--8.1 Enrich stocks_price table with sector and industry, if a ticker doesn't have a match in sp_500_holdings
-- then don't include it in the result. The result should Ticker, Sector, Industry and shouldn't have duplicates.
--（将stocks_price表与sp_500_holdings表连接，获取sector和industry信息，如果ticker在sp_500_holdings中没有匹配，则不包括在结果中。
--结果应该是Ticker、Sector、Industry，并且不应该有重复项。）

SELECT distinct s.ticker, p.sector, p.industry
FROM stocks_price s
INNER JOIN sp500_holdings p ON s.ticker = p.ticker


-- 8.2. Find all products that are not supplied by any supplier.
--（查找所有没有供应商提供的产品。）
SELECT p.productid, p.productname
FROM products p
LEFT JOIN suppliers s ON p.supplierid = s.supplierid
WHERE s.supplierid IS NULL;



-- 8.3. Find all customers who have not placed any orders.
--（查找所有没有下过订单的客户。）
SELECT c.customerid, c.name 
FROM customers c
LEFT JOIN orders o ON c.customerid = o.customer_id
WHERE o.order_id IS NULL;

-- 8.4 find employees who earn more than their managers
--（查找工资高于经理的员工。）
SELECT e.empid, e.firstname || ' ' || e.lastname AS emp,
       m.firstname || ' ' || m.lastname AS mgr, e.salary as employee_salary, m.salary as manager_salary
FROM employees e
INNER JOIN employees m ON e.mgrid = m.empid
WHERE e.salary > m.salary;

-- 8.5 Find all products supplied by suppliers from the USA and category is Beverages.Return  supplier_name, country,productname, unitprice, categoryname
--（查找所有由美国供应商提供的产品，类别为饮料, 返回 supplier_name, country,productname, unitprice, categoryname）
SELECT s.supplierid, s.companyname AS supplier_name, s.country,
       p.productid, p.productname, p.unitprice,
       c.categoryid, c.categoryname
FROM suppliers s
INNER JOIN products p ON s.supplierid = p.supplierid
INNER JOIN categories c ON p.categoryid = c.categoryid
WHERE s.country = 'USA' and c.categoryname = 'Beverages';