--Chapter 5 wildcard filtering(通配符过滤)

--like 关键词：用来模糊匹配数据
--5.1 percentage sign "%" :匹配任意数量的任意字符（可以是 0 个、1 个或多个）
select * from sp500_holdings
where industry like '%oil%'

--5.2 underscore "_" ： 匹配任意单个字符（只能匹配一个字符）
select * from sp500_holdings
where sector like "_echnology"

--Exercise 5 Find all tickers that has the word “Software” in their Industry column in sp500_holdings
--(从 sp500_holdings 表里面提取 Industry 列里面包含 Software 的所有数据)
select * from sp500_holdings where industry like "%Software%"