--Start of chapter 2: 提取数据 
select ticker, Close
from Stocks_price

--2.1 select *
select * 
from Stocks_price

--2.2 distinct key word
select ticker from stocks_price
select distinct ticker from Stocks_price

select distinct ticker,date from Stocks_price

--exercise 2
select portfolio_id,security_id from trade_orders


--2.3 LIMIT N: 限制查询结果的行数<=N 行
select  *
from stocks_price
limit 5

--2.4 OFFSET N: 跳过前面N行的数据， 必须和LIMIT 搭配适用
select  *
from stocks_price
limit 4 OFFSET 3 

--End of chapter 2:提取数据 

--Start of chapter 3: 对数据进行排序

--3.1 对单个column 进行升序排序
select  *
from stocks_price
order by date

--3.2 对多个column 进行升序排序
select  *
from stocks_price
order by date,close

--3.3 DESC: 对数据进行降序排列
select  *
from stocks_price
order by date desc

--3.4 升序，降序排列一起用
select  *
from stocks_price
order by date desc, close

--exercise 3.1
--Question: Display a list of  trader_name, portfolio_id and security_id,quantity
-- in trade_orders table.Sort the output by trader_name
-- first in asceding order and then by quantity in desceding order
--(从 trade_orders 表里面提取 trader_name, portfolio_id and security_id,quantity
-- 然后对 trader_name 进行升序排列， 对 quantity 进行降序排列）
select trader_name,portfolio_id,security_id,quantity 
from trade_orders
order by trader_name,quantity desc


--exercise 3.2
--Get top 5 customers(Name, Phonenumber,  Address,PointsEarned) who earned most points
SELECT Name, PhoneNumber, Address, PointsEarned
FROM customers
ORDER BY PointsEarned DESC
LIMIT 5;

--exercise 3.3
--Get customers(Name, Phonenumber,  Address, PointsEarned) who ranked 3 to 6 in points earned.

SELECT Name, PhoneNumber, Address, PointsEarned
FROM customers
ORDER BY PointsEarned DESC
LIMIT 4 OFFSET 2;

--End of chapter 3: 对数据进行排序


--Start of chapter 4: 对数据进行过滤

--4.1 用 Where 关键词，后面加上过滤条件来进行过滤
select  *
from stocks_price
where ticker ='META'

--4.2 null 的用法
select  *
from sp500_holdings
where sector is null -- 强调一定用is null, 而不是 = null

--4.3 and logcial operator
select *
from stocks_price
where ticker = 'AAPL' and date = '2025-01-06'

--4.4 or logcial operator
select *
from stocks_price
where ticker = 'AAPL' or date = '2025-01-06'

--4.4 AND 和 OR 的优先顺序（SQL先判定and 两边的条件，再判定or 两边的条件）

select *
from stocks_price
where ticker = 'AAPL' or ticker = 'META' and date = '2025-01-06'

--用括号确保执行的顺序
select *
from stocks_price
where (ticker = 'AAPL' or ticker = 'META') and date = '2025-01-06'

--4.5 in operator
SELECT *
FROM stocks_price
WHERE ticker in ( 'AAPL','META’)

SELECT *
FROM stocks_price
WHERE ticker = 'AAPL' OR ticker = 'META’

--4.6 not operator
SELECT *
FROM stocks_price
WHERE NOT ticker = 'AAPL'

SELECT *
FROM stocks_price
WHERE ticker <> 'AAPL'

--Exercise 4
--4.1
select *
from stocks_price
where ticker = 'AAPL'
order by date

--4.2
select date，volume
from stocks_price
where ticker = 'AAPL' and volume > 3000000
order by date

--4.3 
select date,ticker,volume
from stocks_price
where ticker in ('AAPL','META','NVDA') and volume > 3000000
order by date

--Chapter 5 模糊匹配查询 wildcard filtering

--5.1 percentage sign "%" :匹配任意数量的任意字符（可以是 0 个、1 个或多个）
select * from sp500_holdings
where industry like '%oil%'

--5.2 underscore "_" ： 匹配任意单个字符（只能匹配一个字符）