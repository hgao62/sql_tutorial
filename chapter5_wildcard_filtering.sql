--Chapter 5 模糊匹配查询 wildcard filtering

--5.1 percentage sign "%" :匹配任意数量的任意字符（可以是 0 个、1 个或多个）
select * from sp500_holdings
where industry like '%oil%'

--5.2 underscore "_" ： 匹配任意单个字符（只能匹配一个字符）
select * from sp500_holdings
where sector like "_echnology"

--Exercise 5
select * from sp500_holdings where industry like "%Software%"