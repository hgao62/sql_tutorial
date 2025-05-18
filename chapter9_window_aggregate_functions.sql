--Chapter 9 Window aggregation functions(窗口聚合函数)

--9.1 ROW_NUMBER():Assign a unique row ID within each group

SELECT
  ticker,
  date,
  close,
  ROW_NUMBER() OVER (PARTITION BY ticker order by date) AS row_num
FROM stocks_price


--9.2 RANK() / DENSE_RANK(): Ranking by value
SELECT
  ticker,
  date,
  close,
  rank() over (partition by ticker order by close desc ) as price_rank
FROM stocks_price;

--9.3 SUM(...) OVER (...): Sum(val)over():grand total of all rows in the underlying query


SELECT
  ticker,
  date,
  close,
  volume,
  SUM(volume) OVER () AS grand_total_volume
  
FROM stocks_price;

--9.4:Sum(val)over(partition by “column”):total for each value in “column”

SELECT
  ticker,
  date,
  close,
  volume,
  SUM(volume) OVER (PARTITION BY ticker) as ticker_total_volume

FROM stocks_price;




SELECT
  ticker,
  date,
  close,
  volume,
  SUM(volume) OVER () AS grand_total_volume,
  SUM(volume) OVER (PARTITION BY ticker) as ticker_total_volume,
  SUM(volume) OVER (PARTITION BY ticker ORDER BY date) as ticker_running_volume
FROM stocks_price;


--9.5 Sum(val)over(partition by “column1” order by column2): running total for each partition

SELECT
  ticker,
  date,
  close,
  volume,
  SUM(volume) OVER (PARTITION BY ticker ORDER BY date) as ticker_running_volume
FROM stocks_price;

--9.6 comparison of three aggregation

SELECT
  ticker,
  date,
  volume,
  SUM(volume) OVER (PARTITION BY ticker) ticker_volume, 
  SUM(volume) OVER () total_volume,
  SUM(volume) OVER (PARTITION BY ticker ORDER BY date) running_ticker_volume
FROM stocks_price

--9.7 Count, Avg, Min, Max
SELECT
  ticker,
  date,
  volume,
  max(close) OVER (PARTITION BY ticker) max_close, 
  min(close) OVER (PARTITION BY ticker) min_close, 
  avg(close) over (PARTITION BY ticker) avg_close,
  count(ticker) OVER (PARTITION BY ticker) ticker_count
FROM stocks_price



--Exercise
--9.1 In investor_trade table, for each investor and day, rank their trades by price (highest to lowest)."
--(在 investor_trade 表里面，按照价格从高到低对每个投资者和日期的交易进行排名)
select investor,trade_date, ticker, price, rank() over (partition by investor,trade_date order by price desc) as price_rank
from investor_trade


--9.2 In investor_trade table,Compute the running total of quantity each investor has traded for each stock over time.
--(在 investor_trade 表里面，计算每个投资者在每只股票上随时间推移的交易数量的累计总和。)
select investor, ticker, trade_date, trade_id,sum(quantity) over (partition by investor, ticker order by trade_id,trade_date) as running_qty
from investor_trade