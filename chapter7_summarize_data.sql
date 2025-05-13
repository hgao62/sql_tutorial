--Chapter 7 Summarize data and grou pdata

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
SELECT ticker, AVG(close) AS avg_closeFROM stocks_price
WHERE ticker in ('META','GOOG','COST')
GROUP BY ticker
HAVING AVG(close) > 200