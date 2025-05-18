--Chapter 3: Filter Data（过滤数据）

--3.1 用 Where 关键词，后面加上过滤条件来进行过滤
select  *
from stocks_price
where ticker ='META'

--3.2 null 的用法
select  *
from sp500_holdings
where sector is null -- 强调一定用is null, 而不是 = null

--3.3 and logcial operator
select *
from stocks_price
where ticker = 'AAPL' and date = '2025-01-06'

--4.4 or logcial operator
select *
from stocks_price
where ticker = 'AAPL' or date = '2025-01-06'

--3.4 AND 和 OR 的优先顺序（SQL先判定and 两边的条件，再判定or 两边的条件）

select *
from stocks_price
where ticker = 'AAPL' or ticker = 'META' and date = '2025-01-06'

--用括号确保执行的顺序
select *
from stocks_price
where (ticker = 'AAPL' or ticker = 'META') and date = '2025-01-06'

--3.5 in operator
SELECT *
FROM stocks_price
WHERE ticker in ('AAPL','META')

SELECT *
FROM stocks_price
WHERE ticker = 'AAPL' OR ticker = 'META'

--3.6 not operator
SELECT *
FROM stocks_price
WHERE NOT ticker = 'AAPL'

SELECT *
FROM stocks_price
WHERE ticker <> 'AAPL'

--Exercise 3
--3.1 Get AAPL’s ticker, date, close, volume columns from stocks_price table. Sort data by date.
--(从 stocks_price 表里面提取 AAPL 的 ticker, date, close, volume 列的数据， 然后对数据按照日期进行排序)
select *
from stocks_price
where ticker = 'AAPL'
order by date

--3.2 Find date, volume of AAPL’s trading volume that is greater than 3 million. Sort data by date
--(从 stocks_price 表里面提取 AAPL 的交易量 大于 3百万的 的 date, volume 列的数据， 然后对数据按照日期进行排序)
select date,volume
from stocks_price
where ticker = 'AAPL' and volume > 3000000
order by date

--3.3 Find date,volume,ticker of AAPL, META, NVDA ’s trading volume that is greater than 3 million.
--(从 stocks_price 表里面提取 AAPL, META, NVDA 的交易量 大于 3百万的 的 date, volume 列的数据， 然后对数据按照日期进行排序)
select date,ticker,volume
from stocks_price
where ticker in ('AAPL','META','NVDA') and volume > 3000000
order by date
