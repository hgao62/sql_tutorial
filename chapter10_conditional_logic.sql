--Chapter 10: Conditional Logic（条件逻辑）


--10.1 CASE WHEN: 计算列

SELECT
  ticker,
  volume,
  CASE
    WHEN volume > 1000000 THEN 'High'
    WHEN volume BETWEEN 500000 AND 1000000 THEN 'Medium'
    ELSE 'Low'
  END AS volume_category 
FROM stocks_price
WHERE ticker = 'AAPL'


--10.2 ifnull: 处理空值

select 
ticker, ifnull(sector,'Unknown') as sector, ifnull(industry,'Unknown') as industry
from sp500_holdings

--10.3 conditional aggregation with case when
SELECT
  ticker,
  date,
  close,
  volume,
  count ( case when volume > 50000000 then 1 end) as high_volume_count,
  count ( case when volume <=50000000 then 1 end) as low_volume_count,
  
  count(*) as total_count
FROM stocks_price
WHERE ticker = 'AAPL'


--Exercise 10(common interview question)
--10.1 calculate the net position of each ticker in trade_order table. The result should be Ticker, Net Position.
--(计算 trade_order 表里面每个 ticker 的净头寸。结果应该是 Ticker 和 Net Position)
SELECT
  portfolio_id,
  security_id,
  SUM(CASE WHEN side = 'BUY' THEN quantity ELSE -quantity END) AS net_position    
FROM trade_orders
GROUP BY portfolio_id,security_id


--10.2 Count how many trades each investor made for 'TSLA'
-- (计算每个投资者对 'TSLA' 的交易数量)
select investor, Count( case when ticker ='TSLA' then 1 end) as trade_count
from investor_trade
group by investor


--10.3 label ticker as high if peratio > 50, medium if peratio between 20 and 50, else low, NA if peratio is null
-- (如果 peratio > 50，则将 ticker 标记为高；如果 peratio 在 20 和 50 之间，则标记为中等，否则标记为低，如果 peratio 为 null，则标记为 NA)
select ticker,peratio,
case when peratio is null then 'NA'
     when peratio > 50 then 'High'
     when peratio between 20 and 50 then 'Medium'
     else 'Low' 
end as peratio_label

from tickerinfo