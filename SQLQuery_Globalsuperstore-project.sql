select*
from dbo.Orders$

--- Number of orders yearly
select format([order date],'yyyy') as year, 
count(Sales) as number_order
from dbo.Orders$
group by format([order date], 'yyyy')
order by year

-- Shipping cost mean yearly
select FORMAT([order date], 'yyyy') as year,
avg([shipping cost]) as mean_shippingcost
from dbo.Orders$
group by FORMAT([order date], 'yyyy')
order by year


-- Delivery time mean 
select FORMAT([order date], 'yyyy') as year,
avg(cast(DATEDIFF(day, [order date], [Ship Date]) as float)) as days_between
from dbo.Orders$
group by FORMAT([order date], 'yyyy')


-- Common Shipmod
select [Ship Mode], count(*) as number_shipmode
from dbo.Orders$
group by [Ship Mode]
order by number_shipmode desc

--Cost by year, category
select FORMAT([order date], 'yyyy') as year, [Category], avg((([Sales] - [Profit])/[quantity])) as Cost 
from dbo.Orders$
group by FORMAT([order date], 'yyyy'), [Category]
order by year,Category

--Sales, Profit by country
select [country],round(sum(Sales),2) as total_sales , round(SUM(Profit),2) as total_profit
from dbo.Orders$
group by [country]
order by total_sales desc
