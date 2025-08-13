#  Sales Trend Analysis – Superstore Dataset   

##  Objectives
- Calculate **total monthly revenue**.  
- Measure **monthly order volume**.  
- Determine **Average Order Value** for profitability tracking.  

## Tools & Technologies  
- **SQL Server Management Studio (SSMS)**  
- **T-SQL functions**:  
  - `DATEFROMPARTS()` - Create first day of each month for grouping.  
  - `FORMAT()` - Convert dates to `yyyy-MM` format for reporting.  
  - `CAST()` - Format averages to 2 decimal places for clarity.  

##  Code
```sql
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
```

## Output (SSMS Result)  
![Output](https://github.com/jananiii18/Sales-Trend-Analysis/blob/fe1041d33cde4692e689c1d1dff699cb6c1e939d/monthly_revenue.png) 

## Key Insights  
- Sales are highest in November and december, likely due to holiday shopping.    
- Average order value stays about the same each month, even when order counts change.  
