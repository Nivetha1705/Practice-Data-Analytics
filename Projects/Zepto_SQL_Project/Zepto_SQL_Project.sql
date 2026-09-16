use zepto_sql_project;

drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

-- DATA EXPLORATION
select count(*) from zepto;

-- sample data
select * from zepto
limit 10;

-- null values
select * from zepto
where name is null 
or
category is null 
or 
mrp is null 
or
discountPercent is null 
or 
discountedSellingPrice is null 
or 
weightInGms is null 
or 
availableQuantity is null 
or 
outOfStock is null 
or 
quantity is null;

-- different product categories
select distinct category
from zepto
order by category;

-- products in stock vs out of stock
select outOfStock,
count(sku_id)
from zepto
group by outOfStock;

-- products names present multiple times
select name, count(sku_id) as "Number of SKU's"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;

-- DATA CLEANING

-- Products with price = 0
select * from zepto
where mrp = 0 or discountedSellingprice = 0; 

-- Delete the product with mrp 0
Delete from zepto
where mrp = 0;  

SET SQL_SAFE_UPDATES = 0;
DELETE FROM zepto WHERE mrp = 0;
SET SQL_SAFE_UPDATES = 1;  -- turn it back on afterward, good practice

-- convert paise to rupees in the dataset

SET SQL_SAFE_UPDATES = 0;

update zepto
set mrp = mrp/100.0,
discountedSellingPrice=discountedSellingPrice/100.0;

SET SQL_SAFE_UPDATES = 1;  -- turn it back on afterward, good practice

select mrp, discountedSellingPrice from zepto;  

#Now we've explored and cleaned the data now let's dive into some business questions and use sql to uncover valuable insights.alter

-- Q1. Find the top 10 best-value products based on the discount percentage
select distinct name, mrp, discountpercent
from zepto
order by discountPercent desc
limit 10;  

-- Q2. What are the Products with high MRP but out of Stock  
select distinct name, mrp
from zepto
where outOfStock = 1 and mrp >300
order by mrp desc; 

-- Q3. calculate Estimated Revenue for each category
select category, sum(discountedSellingPrice * availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue;

-- Q4. Find all products where MRP is greater than Rs.500 and discount is less than 10%
select distinct name, mrp, discountpercent
from zepto
where mrp > 500 and discountpercent < 10
order by mrp desc, discountpercent desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category, avg(discountPercent) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best values
select distinct name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto
where weightInGms >= 100
order by price_per_gram;

-- Q7. Group the products into categories like low, Medium, Bulk.
select distinct name, weightInGms,
case when weightInGms < 1000 then "Low"
     when weightInGms < 5000 then "Medium"
     else "Bulk"
     end as weight_category
from zepto;     


-- Q8. What is thetotal Inventory Weight Per Ctegory
select category,
Sum(weightInGms * availableQuantity) as total_weight
from zepto
group by category
order by total_weight;  