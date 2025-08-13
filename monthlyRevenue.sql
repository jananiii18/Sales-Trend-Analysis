-- Analyze monthly revenue and order volume

select 
datefromparts(year(Order_Date), month(Order_Date),1) as month_start,
format(datefromparts(year(Order_Date), month(Order_Date),1),'yyyy-MM') as year_month,
sum(Sales) as total_revenue,
count(distinct Order_ID) as order_volume,
cast(sum(Sales) / count(distinct Order_ID)as decimal(10,2)) AS avg_order_value
from dbo.superstore
where Order_Date is not null
group by datefromparts(year(Order_Date), month(Order_Date),1)
order by month_start
