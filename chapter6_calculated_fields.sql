--Chapter 6: Calculated Fields(计算字段)

--6.1 拼接 column  
SELECT ticker, sector ||
       ' (' || industry ||')'
FROM sp500_holdings

--6.2 使用别名（alias)
SELECT ticker, sector ||
       ' (' || industry ||')' as sector_industry
FROM sp500_holdings;

--6.3 数学计算
select ticker, date, close, close*0.8 as adjusted_close
from stocks_price
