# Walmart-Sales-Analysis-Sql
## About
This project aims to explore the Walmart Sales data to understand top performing products and cities, sales trend of of different products, customer behaviour. This aims is to study how sales strategies can be improved and optimized. 

## Purpose of the project
The major aim of thie project is to gain insights into the sales data of Walmart to understand the different factors that affect sales of different products in different branches.

## About Dataset
The dataset we used for this project contains the 17 columns and 1000 rows:

Column(Data Type)-----------------------Description              
---------------------- |--------------------------------------
invoice_id(VARCHAR(30))-----------------Invoice of the sales made
branch(VARCHAR(5))----------------------Branch at which sales were made
city (VARCHAR(30))----------------------The location of the branch
customer_type(VARCHAR(30) )-------------The type of the customer           
gender(VARCHAR(10))---------------------Gender of the customer making purchase
product_line(VARCHAR(100))--------------Product line of the product solf 
unit_price(DECIMAL(10, 2))--------------The price of each product 
quantity(INT)---------------------------The amount of the product sold   
VAT(FLOAT(6, 4))------------------------The amount of tax on the purchase    
total(DECIMAL(10, 2))-------------------The total cost of the purchase   
date(DATE)------------------------------The date on which the purchase was made
time(TIMESTAMP)-------------------------The time at which the purchase was made 
payment_method(DECIMAL(10, 2))----------The total amount paid                  
cogs(DECIMAL(10, 2))--------------------Cost Of Goods sold          
gross_margin_percentage(FLOAT(11, 9))---Gross margin percentage               
gross_income(DECIMAL(10, 2))------------Gross Income                         
rating(FLOAT(2, 1))---------------------Rating                           

## Approach Used

**Data Cleaning:**
     This is the first step where inspection of data is done to make sure all "NULL" and "MISSING" values are detected and data replacement methods are used to replace the "MISSING" or "NULL" values present in our data.

> 1. Build a database
> 2. Create table and insert the data.
> 3. Select columns with null values in them. There are no null values in our database as in creating the tables, we set **NOT NULL** for each field, hence null values are filtered out.

**Feature Engineering:**
3.   This will help use generate some new columns from existing ones.
   
> 1. Add a new column named `time_of_day` to give insight of sales in the "Morning", "Afternoon" and "Evening". This will help answer the question on which part of the day most sales are made.

> 2. Add a new column named `day_name` that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.

> 3. Add a new column named `month_name` that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.

**Conclusion:**

## Business Questions To Answer

### General Question
1. How many unique cities does the data have?
2. In which city is each branch?

### Products Based Questions
1. How many unique product lines does the data have?
2. What is the most common payment method?
3. What is the most selling product line?
4. What is the total revenue by month?
5. What month had the largest COGS?
6. What product line had the largest revenue?
7. What is the city with the largest revenue?
8. What product line had the largest VAT?
9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
10. Which branch sold more products than average product sold?
11. What is the most common product line by gender?
12. What is the average rating of each product line?

### Sales Based Questions

1. Number of sales made in each time of the day per weekday
2. Which of the customer types brings the most revenue?
3. Which city has the largest tax percent/ VAT (**Value Added Tax**)?
4. Which customer type pays the most in VAT?

### Customer Based Questions

1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. What is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per branch?
7. Which time of the day do customers give most ratings?
8. Which time of the day do customers give most ratings per branch?
9. Which day fo the week has the best avg ratings?
10. Which day of the week has the best average ratings per branch?


