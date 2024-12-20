use walmart;

SELECT * FROM walmart.sales;

-- 1. Time_of_day

SELECT time,
(CASE 
	WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
	WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
	ELSE "Evening" 
END) AS time_of_day
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = (
	CASE 
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
		WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
		ELSE "Evening" 
	END
)
WHERE `Invoice ID` IS NOT NULL;  -- Assuming `Invoice ID` is the key column

-- 2. Day_name

Select date,
DAYNAME(date) as day_name
from sales;

alter table sales add column day_name varChar(10);

update sales
set day_name = dayname(date);

-- 3. Month_name

Select date,
monthname(date) as month_name
from sales;

alter table sales add column month_name varchar(10);

update sales
set month_name = monthname(date);

-- 4. VAT
Select `Unit price`, `Quantity`, `Tax 5%`, (`Unit price`* `Quantity`*`Tax 5%`) as VAT
from sales;

Alter table sales add column VAT float; 

UPDATE sales
SET VAT = (`Unit price` * `Quantity` * `Tax 5%`)
WHERE `Invoice ID` is not null ;


----------------------------------- Explorary Data Analysis (EDA) -------------------------------
## Generic Questions
-- 1. How many distinct cities are present in the dataset?
select distinct(city) from sales;

-- 2. In which city is each branch situated ?
select distinct branch , city from sales ;

-- Product Analysis
-- 1. How many distinct product lines are there in the dataset?
select count(distinct 'Product line') from sales;

-- 2.What is the most common payment method?
select Payment, count(Payment) as common_payment_method
from sales
group by Payment
order by common_payment_method desc
limit 1;

-- 3.What is the most selling product line?
select `Product line`, count(`Product line`) as most_selling_product
from sales
group by `Product line`
order by most_selling_product desc
limit 1;
 
-- 4.What is the total revenue by month?
select month_name, sum(Total) as Total_revenue
from sales
group by month_name
order by Total_revenue desc;

-- 5.Which month recorded the highest Cost of Goods Sold (COGS)?
select month_name, sum(cogs) as total_cogs
from sales
group by month_name
order by total_cogs desc limit 1;

-- 6.Which product line generated the highest revenue?
select `Product line`, sum(Total) as total_revenue
from sales
group by `Product line`
order by total_revenue desc limit 1;
 
 -- 7.Which city has the highest revenue?
 select city, sum(Total) as total_revenue
 from sales
 group by city
 order by total_revenue desc limit 1;
 
 -- 8.Which product line incurred the highest VAT?
 select `Product line` , sum(VAT) as highest_VAT
 from sales
 group by `Product line`
 order by highest_VAT desc limit 1;
 
 -- 9.Retrieve each product line and add a column product_category, indicating 'Good' or 
 -- 'Bad,'based on whether its sales are above the average.
  alter table sales add column product_category varchar(20);
 
 update sales
 join (select avg(total) as avg_tot from sales) as avg_sales
 set product_category = 
     case 
         when total >= avg_sales.avg_tot then 'Good'
         else 'Bad'
	  end;
 
-- 10.Which branch sold more products than average product sold?
select branch, sum(quantity) 
from sales
group by branch
having sum(quantity) > avg(quantity)
order by sum(quantity)  desc limit 1;

-- 11.What is the most common product line by gender?
select gender , `product line`, count(gender) as product_count_gender
from sales
group by  gender , `product line`
order by product_count_gender desc;

-- 12.What is the average rating of each product line?
select `product line`, round(avg(rating),2) as avg_rating
from sales
group by `product line`
order by avg_rating desc;

-- Sales Analysis
-- 1.Number of sales made in each time of the day per weekday.
select time_of_day, day_name, count(`invoice ID`) as Perday_sale
from sales
group by  time_of_day, day_name
having day_name not in ('Sunday','Saturday');

-- 2.Identify the customer type that generates the highest revenue.
select `customer type`, round(sum(total), 2) as total_sales
from sales
group by `customer type`
order by total_sales desc limit 1;

-- 3.Which city has the largest tax percent/ VAT (Value Added Tax)?
select city, sum(VAT) as total_VAT
from sales
group by city
order by total_VAT desc limit 1;

-- 4.Which customer type pays the most in VAT?
select `customer type`, sum(VAT) as total_VAT
from sales
group by `customer type`
order by total_VAT desc limit 1;

-- Customer Analysis
-- 1.How many unique customer types does the data have?
select count(distinct `customer type`) from sales;

-- 2.How many unique payment methods does the data have?
select count(distinct Payment) from sales;

-- 3.Which is the most common customer type?
select `customer type`, count(`customer type`) as common_customer
from sales
group by `customer type`
order by common_customer desc limit 1;

-- 4.Which customer type buys the most?
select `customer type`, round(sum(total),2) as total
from sales
group by `customer type`
order by total desc limit 1;

select `customer type`, count(*) as most_buyers
from sales
group by `customer type`
order by most_buyers desc limit 1;

-- 5. What is the gender of most of the customers?
select gender, count(*) as all_gender
from sales
group by gender
order by all_gender desc limit 1;

-- 6. What is the gender distribution per branch?
select branch, gender, count(gender) as gender_distribution
from sales
group by gender, branch
order by branch;

-- 7. Which time of the day do customers give most ratings?
select time_of_day, count(rating) as Ratings
from sales
group by time_of_day
order by Ratings desc limit 1;

-- 8. Which time of the day do customers give most ratings per branch?
select time_of_day, branch, count(rating) as ratings
from sales
group by  branch, time_of_day
order by Ratings desc;

-- 9. Which day of the week has the best avg ratings?
select day_name, avg(rating) as avg_rating
from sales
group by day_name
order by avg_rating desc limit 1;

-- 10. Which day of the week has the best average ratings per branch?
select branch, day_name,  avg(rating) as average_ratings
from sales
group by day_name, branch
order by average_ratings desc limit 1;








