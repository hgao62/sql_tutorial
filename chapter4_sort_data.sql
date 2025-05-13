--4.1 对单个column 进行升序排序
select  *
from stocks_price
order by date

--4.2 对多个column 进行升序排序
select  *
from stocks_price
order by date,close

--4.3 DESC: 对数据进行降序排列
select  *
from stocks_price
order by date desc

--4.4 升序，降序排列一起用
select  *
from stocks_price
order by date desc, close


--4.5 LIMIT N: 限制查询结果的行数<=N 行
select  *
from stocks_price
order by close
limit 5

--4.6 OFFSET N: 跳过前面N行的数据， 必须和LIMIT 搭配适用
select  *
from stocks_price
order by close
limit 4 OFFSET 3 

--exercise 4.1
--Question: Display a list of  trader_name, portfolio_id and security_id,quantity
-- in trade_orders table.Sort the output by trader_name
-- first in asceding order and then by quantity in desceding order
--(从 trade_orders 表里面提取 trader_name, portfolio_id and security_id,quantity
-- 然后对 trader_name 进行升序排列， 对 quantity 进行降序排列）
select trader_name,portfolio_id,security_id,quantity 
from trade_orders
order by trader_name,quantity desc


--exercise 4.2
--Get top 5 customers(Name, Phonenumber,  Address,PointsEarned) who earned most points
SELECT Name, PhoneNumber, Address, PointsEarned
FROM customers
ORDER BY PointsEarned DESC
LIMIT 5;

--exercise 4.3
--Get customers(Name, Phonenumber,  Address, PointsEarned) who ranked 3 to 6 in points earned.

SELECT Name, PhoneNumber, Address, PointsEarned
FROM customers
ORDER BY PointsEarned DESC
LIMIT 4 OFFSET 2;

