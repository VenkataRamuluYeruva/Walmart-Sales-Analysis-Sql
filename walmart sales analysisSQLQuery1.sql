-- create a new database for walmart data storage
create database walmart

-- use database
use walmart

           -------------------- * Feature Engineering * ------------------------
-- time of day
SELECT 
    time,
    CASE 
        WHEN CAST(time AS TIME) BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN CAST(time AS TIME) BETWEEN '12:00:01' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM 
    Walmart_Data;

-- Add Time_of_Day to the table
alter table Walmart_Data add time_of_date VARCHAR(50)

--update time of day in the table
update Walmart_Data set time_of_date=
(case
	 when cast(time as Time) between '00:00:00' and '12:00:00' then 'Morning'
	 when cast(time as Time) between '12:00:01' and '16:00:00' then 'Afternoon'
	 else 'Evening'
end)


-- day name
select DATENAME(weekday,date)as week_day 
from Walmart_Data

-- add day_name column in table
alter table Walmart_Data add day_name varchar(20)

-- update the all day_name in the table with correct day name
update Walmart_Data set day_name=DATENAME(weekday,date)


-- month_name
select DATENAME(month,date)as month_name from Walmart_Data

-- add month_name column to the table
alter table Walmart_Data add month_name varchar(20)

-- update month_name with correct month name
update Walmart_Data set month_name=DATENAME(month,date)


  ------------------ * Data Analysis * -------------------------
-- . How many unique cities does the data have?
select count(distinct city)as No_of_unique_cities from Walmart_Data

--  In which city is each branch?
select distinct city,branch from Walmart_Data

-- 1. How many unique product lines does the data have?
select distinct Product_line from Walmart_Data

-- 2. What is the most common payment method?
select top 1 payment,count(*) from Walmart_Data group by payment order by count(*) desc

-- 3. What is the most selling product line?
select top 1 product_line,sum(quantity)as total_product_sell_quantity
from Walmart_Data group by Product_line order by total_product_sell_quantity desc

-- 4. What is the total revenue by month?
select month_name,round(sum(Total),2)as total_revenue from Walmart_Data
group by month_name order by total_revenue desc

-- 5. What month had the largest COGS?
select month_name,sum(cogs) as largest_cogs from Walmart_Data 
group by month_name order by largest_cogs desc

-- 6. What product line had the largest revenue?
select top 1 Product_line,round(sum(total),2)as total_product_revenue from Walmart_Data
group by Product_line order by total_product_revenue desc

-- 7. What is the city with the largest revenue?
select top 1 city,round(sum(total),2)as revenue from
Walmart_Data group by city order by revenue desc

-- 8. What product line had the largest VAT?
select product_line,round(avg(tax),2)as vat from Walmart_Data
group by Product_line order by vat desc

--9.  Fetch each product line and add a column to those product line showing "Good", "Bad".Good if its greater than average sales
select product_line,
	case
		when sales>(select AVG(quantity) from Walmart_Data) Then 'Good'
		else 'Bad'
	end
from
(select product_line,sum(quantity)as sales from Walmart_Data
group by Product_line)as t

-- 10. Which branch sold more products than average product sold?
select branch,sum(quantity)as sold from Walmart_Data
group by branch having sum(quantity)>(select avg(quantity) from Walmart_Data)

-- 11. What is the most common product line by gender?
select Product_line,gender,cnt from (select product_line,gender,count(product_line)as cnt,
(rank()over(partition by gender order by count(product_line) desc))as rank_no from Walmart_Data
group by Product_line,gender) as t1
where rank_no=1

-- 12. What is the average rating of each product line?
select product_line, round(avg(rating),2)as average from Walmart_Data
group by Product_line order by average desc

     ------------- * SALES ANAYLYSIS * --------------

-- 1. Number of sales made in each time of the day per weekday
select time_of_day,count(*)as sales_cnt from Walmart_Data
group by time_of_day order by sales_cnt desc

-- 2. Which of the customer types brings the most revenue?
select customer_type,round(sum(total),2)as revenue from Walmart_Data 
group by Customer_type

-- 3. Which city has the largest tax percent/ VAT (**Value Added Tax**)?
select city,round(avg(tax),2)as tax_rate from Walmart_Data
group by city order by tax_rate desc

-- 4. Which customer type pays the most in VAT?
select customer_type,round(avg(tax),2)as vat from Walmart_Data
group by customer_type order by vat desc

         -----------  *  CUSTOMER ANALYSIS  *  --------------

--1.How many unique customer types does the data have?
select count(distinct customer_type)as unique_customer_types from Walmart_Data

-- 2. How many unique payment methods does the data have?
select count(distinct payment)as payment_types from Walmart_Data

-- 3. What is the most common customer type?
select customer_type,count(customer_type)as cnt from Walmart_Data
group by Customer_type order by cnt desc

-- 4. Which customer type buys the most?
select customer_type,count(customer_type)as cnt from Walmart_Data
group by Customer_type order by cnt desc

-- 5. What is the gender of most of the customers?
select gender,count(*)as no_of_customers from Walmart_Data
group by gender order by count(*) desc
 
-- 6. What is the gender distribution per branch?
select branch,gender,count(gender) from Walmart_Data
group by branch,gender order by branch,count(gender) desc

-- 7. Which time of the day do customers give most ratings?
select time_of_day,avg(rating)as avg_rating from Walmart_Data
group by time_of_day

-- 8. Which time of the day do customers give most ratings per branch?
select branch,time_of_day,round(avg(rating),2)as avg_rating from Walmart_Data
group by Branch,time_of_day order by branch

--9. Which day fo the week has the best avg ratings?
select day_name,round(avg(rating),2)as avg_rating from Walmart_Data
group by day_name order by avg_rating desc

-- 10. Which day of the week has the best average ratings per branch?
select branch,day_name,round(avg(rating),2)as avg_rating from Walmart_Data
group by branch,day_name order by branch,day_name,avg_rating