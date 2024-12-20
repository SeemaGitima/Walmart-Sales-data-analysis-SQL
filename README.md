# Walmart-Sales-data-analysis-SQL

![Sample Image](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRztL0WzSHxYdzc8FmFZ8pCYA8GxsAThVhioAoQIrfPmnM2527iMnLvRXyd_5VO1xYdRg&usqp=CAU)


# Walmart Sales Data Analysis - SQL Project

## Project Overview

This project involves an in-depth analysis of Walmart's sales data, aimed at identifying high-performing branches and products, analyzing sales trends across various product categories, and understanding customer behavior. The primary goal is to enhance and optimize sales strategies across different Walmart branches. The dataset utilized in this project is sourced from the Kaggle Walmart Sales Forecasting Competition.

## Project Objectives

The main objective of this project is to extract valuable insights from Walmart's sales data, focusing on the various factors that influence sales performance across different branches. Specifically, the project aims to:
- Identify the top-performing branches.
- Analyze the sales patterns of different products.
- Understand customer purchasing behavior and assess the profitability of various customer segments.

## Dataset Description

The dataset used for this project was obtained from the Kaggle Walmart Sales Forecasting Competition. It contains sales transaction data from three Walmart branches located in Mandalay, Yangon, and Naypyitaw, respectively. 

The data contains 17 columns and 1000 rows:
| Column            | Description                                   | Data Type        |
|-------------------|-----------------------------------------------|------------------|
| invoice_id        | Invoice of the sales made                     | VARCHAR(30)      |
| branch            | Branch at which sales were made               | VARCHAR(5)       |
| city              | The location of the branch                    | VARCHAR(30)      |
| customer_type     | The type of the customer                      | VARCHAR(30)      |
| gender            | Gender of the customer making purchase        | VARCHAR(10)      |
| product_line      | Product line of the product sold              | VARCHAR(100)     |
| unit_price        | The price of each product                     | DECIMAL(10, 2)   |
| quantity          | The amount of the product sold                | INT              |
| Tax 5%            | The amount of tax on the purchase             | FLOAT(6, 4)      |
| total             | The total cost of the purchase                | DECIMAL(12, 4)   |
| date              | The date on which the purchase was made       | DATETIME         |
| time              | The time at which the purchase was made       | TIME             |
| payment           | The total amount paid                         | DECIMAL(10, 2)   |
| cogs              | Cost Of Goods sold                            | DECIMAL(10, 2)   |
| gross_margin_pct  | Gross margin percentage                       | FLOAT(11, 9)     |
| gross_income      | Gross Income                                  | DECIMAL(12, 4)   |
| rating            | Rating                                        | FLOAT(2, 1)      |


## Analysis Areas

This project is designed to perform detailed analyses across three primary areas: Product Analysis, Sales Analysis, and Customer Analysis. Each area provides critical insights that will assist in optimizing Walmart's sales strategies, product offerings, and customer engagement.

### 1. Product Analysis

**Objective**: 
The goal of the Product Analysis is to gain a deeper understanding of the performance of different product lines. This involves:
- **Identifying top-performing product lines**: Analyzing sales data to determine which product lines consistently generate the highest sales.
- **Assessing underperforming product lines**: Pinpointing product lines that are not performing as expected, and identifying potential reasons for their lower sales.
- **Product Line Improvement**: Offering actionable insights on how to improve sales in weaker product lines through strategic changes, such as marketing adjustments or product optimization.

By performing this analysis, we aim to identify opportunities for product optimization, allowing Walmart to refine its product assortment and boost overall sales.

### 2. Sales Analysis

**Objective**: 
The focus of the Sales Analysis is to evaluate the sales performance across different dimensions and identify trends that can guide better decision-making. The analysis will:
- **Examine sales trends**: Evaluate sales patterns over time, including seasonality, day-of-week, time-of-day, and month-to-month variations.
- **Evaluate sales strategies**: Assess the effectiveness of different sales strategies applied by the company, such as pricing, promotions, and inventory management.
- **Provide actionable recommendations**: Based on identified trends, suggest necessary adjustments to sales strategies to improve overall sales performance and increase revenue.

The insights derived from this analysis will help Walmart optimize its sales strategies, ensuring higher efficiency and effectiveness in driving revenue.

### 3. Customer Analysis

**Objective**: 
The Customer Analysis aims to understand the purchasing behavior and characteristics of various customer segments. This includes:
- **Customer Segmentation**: Identifying distinct customer groups based on purchasing patterns, demographics, or behaviors.
- **Understanding purchasing trends**: Analyzing how different customer segments respond to products, promotions, and seasonal changes.
- **Profitability analysis**: Evaluating the profitability associated with each customer segment, helping to identify which segments are the most valuable to the business.

Through this analysis, Walmart can refine its customer targeting, tailor marketing campaigns more effectively, and maximize the profitability of its customer base.

---

These analyses will provide Walmart with critical insights into product performance, sales strategies, and customer behavior, leading to data-driven decisions that enhance business outcomes across all areas.

## Methodology

### 1. Data Wrangling

In this phase, the data was carefully prepared and cleaned to ensure it was suitable for analysis. The following steps were undertaken:
- **Data Integrity Check**: The dataset was thoroughly examined for any missing or NULL values. Necessary replacements or corrections were made as required.
- **Database Creation**: A relational database was set up to store the cleaned data in an organized manner.
- **Table Creation and Data Insertion**: The relevant tables were created, and the data was inserted into the tables to facilitate structured analysis.
- **Null Value Handling**: Since the schema was designed with `NOT NULL` constraints, there were no missing values in the dataset after initial cleaning.

### 2. Feature Engineering

New features were derived from the existing data to facilitate deeper analysis and answer specific business questions:
- **Time of Day**: A new column, `time_of_day`, was added to categorize sales transactions into three periods: Morning, Afternoon, and Evening. This feature allows for analysis of sales trends based on the time of day.
  
- **Day Name**: A new column, `day_name`, was created to extract the day of the week (e.g., Mon, Tue, Wed, Thu, Fri) for each transaction. This feature helps in identifying the busiest days of the week for each branch.
  
- **Month Name**: A new column, `month_name`, was added to extract the month of the year (e.g., Jan, Feb, Mar) from the transaction date. This allows us to determine which months of the year experience the highest sales and profit.

- **VAT (Value-Added Tax)**: A new column, `VAT`, was calculated to represent the tax amount applied to each purchase. This feature helps identify which product categories incur the highest VAT.

### 3. Data Analysis

With the newly created features, several analyses were conducted to derive insights:
- **Product Performance Analysis**: We analyzed the performance of different product lines to identify top-performing products and areas where improvements are needed. This helps in optimizing product offerings.
  
- **Sales Trend Analysis**: The analysis focused on sales trends based on time of day, day of the week, and month. This insight helps evaluate the effectiveness of sales strategies and understand which times and days drive the highest sales.

- **Customer Segmentation and Behavior**: We analyzed customer purchasing patterns to segment customers based on their behavior. This helps in identifying profitable customer segments and optimizing marketing strategies to target them more effectively.

***3.  Exploratory Data Analysis (EDA)***

Conducting exploratory data analysis is essential to address the project's listed questions and objectives.

## Business Questions to Answer

### Generic Questions
1.	How many distinct cities are present in the dataset?
2.	In which city is each branch situated?

### Product Analysis
1.	How many distinct product lines are there in the dataset?
2.	What is the most common payment method?
3.	What is the most selling product line?
4.	What is the total revenue by month?
5.	Which month recorded the highest Cost of Goods Sold (COGS)?
6.	Which product line generated the highest revenue?
7.	Which city has the highest revenue?
8.	Which product line incurred the highest VAT?
9.	Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,' based on whether its sales are above the average.
10.	Which branch sold more products than average product sold?
11.	What is the most common product line by gender?
12.	What is the average rating of each product line?

### Sales Analysis
1.	Number of sales made in each time of the day per weekday
2.	Identify the customer type that generates the highest revenue.
3.	Which city has the largest tax percent/ VAT (Value Added Tax)?
4.	Which customer type pays the most VAT?

### Customer Analysis
1.	How many unique customer types does the data have?
2.	How many unique payment methods does the data have?
3.	Which is the most common customer type?
4.	Which customer type buys the most?
5.	What is the gender of most of the customers?
6.	What is the gender distribution per branch?
7.	Which time of the day do customers give most ratings?
8.	Which time of the day do customers give most ratings per branch?
9.	Which day of the week has the best avg ratings?
10.	Which day of the week has the best average ratings per branch?

## Conclusion

This analysis provides valuable insights into the performance of various Walmart branches, product lines, and customer segments. By leveraging these insights, Walmart can enhance its sales strategies, optimize inventory management, and improve customer targeting. The findings from this project serve as a foundation for data-driven decision-making aimed at improving overall sales performance and profitability.
---
