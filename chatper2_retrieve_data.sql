--Chapter 2: Retrieve Data（提取数据） 

--2.1 select data using column names
select ticker, Close
from Stocks_price

--2.2 select *
select * 
from Stocks_price

--2.3 distinct key word
select ticker from stocks_price
select distinct ticker from Stocks_price

select distinct ticker,date from Stocks_price


--exercise 2: Display a list of unique portfolio_id and security_id in trade_orders table
-- (从 trade_orders 表里面提取 portfolio_id and security_id, 只提取唯一的值)
select distinct portfolio_id,security_id from trade_orders

