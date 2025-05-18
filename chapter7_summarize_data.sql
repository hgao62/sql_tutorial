--Chapter 7 Summarize data and group data(汇总数据和分组数据)

--Start of Summarizing data

--7.1 avg fucntion(取平均值）
select avg(close) as avg_close
from stocks_price
where ticker = 'AAPL'

--7.2 count function(计数）
--COUNT(*):count the number of rows in a table, whether columns contain values or NULL
select count(*)
from sp500_holdings
--这个返回503 行

--COUNT(column): count the number of rows that have values in a specific column, ignoring NULL values.
select count(industry)
from sp500_holdings
--这个返回501 行， 因为有2行industry 的数据是Null,不会被算到最后结果

--7.3 max, min function
select max(close) as max_close
from stocks_price
where ticker = 'AAPL'

select min(close) as min_close
from stocks_price
where ticker = 'AAPL'

--7.4 sum function(求和函数）
select sum(quantity) total_buy_qty 
from trade_orders
where security_id = 'AAPL'
and side = 'BUY'

--7.5 aggregate on distinct values
select count(distinct security_id) as unique_tickers
from trade_orders

--7.6 Apply multiple aggregation functions on same column
select max(close) as max_close,
       min(close) as min_close,avg(close) as avg_close
from stocks_price
where ticker = 'AAPL'

--End of summarizing data

--Start of grouping data

--7.7 group by：对数据进行分组，然后做aggregation
select ticker,avg(close) as avg_close
from stocks_price
group by ticker

--7.8 having: filtering in groups(对分组的数据进行过滤)
select ticker,avg(close) as avg_close
from stocks_price
group by ticker
having avg(close) > 150

--7.9 use both where to filter data first and then having to
-- filter in groups
SELECT ticker, AVG(close) AS avg_close FROM stocks_price
WHERE ticker in ('META','GOOG','COST')
GROUP BY ticker
HAVING AVG(close) > 200


--Excercise 7
--7.1 Get  maximum, minimum, average trading volume for ticker COST between 2024-01-01 to 2024-02-01 in table stocks_price.
--(从 stocks_price 表里面提取 COST 的最大值，最小值，平均值的交易量，时间范围是2024-01-01到2024-02-01)

select max(volume) as max_volume,
       min(volume) as min_volume,
       avg(volume) as avg_volume
from stocks_price
where ticker = 'COST'
and date >= '2024-01-01' and date<= '2024-02-01'


--7.2 Get each porfolio's total long position in table trade_orders
--*long position = price* quantity and side is BUY
--(从 trade_orders 表里面提取 portfolio_id, price, quantity
-- 然后对 price 和 quantity 进行相乘， 只提取 side 是 BUY 的数据)
select portfolio_id, sum(price*quantity) as total_long_position
from trade_orders
where side = 'BUY'
group by portfolio_id



--7.3 Pull the data for  porfolio that has short position  in table trade_orders that meets the following criteria.

--1.side is sell and quantity is greater than 500
--2.portfolio’s short position is greater than 50000s

--（从 trade_orders 表里面提取 portfolio_id, price, quantity
-- 然后对 price 和 quantity 进行相乘， 只提取 side 是 SELL 的数据， quantity 大于500 的数据）
-- 资产组合的空头头寸大于50000
select portfolio_id, sum(price*quantity) as total_short_position
from trade_orders
where side = 'SELL' and quantity > 500
group by portfolio_id
having sum(price*quantity) > 50000
