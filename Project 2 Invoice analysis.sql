create database invoice_data;
use invoice_data;
select *from invoices;

# Q1. How many types of product_id is available?
# Q2. Overall which product_ID have heighest and Lowest revenue and what are their average cost per item?
# Q3. List first_name and job of people who belong to product_id of heights revenue collected.
# Q4. List of people who are working as a Economist?
# Q5. List of people who are NOT working as a Economist?
# Q6. List of people who work as economist and their paid amount is less than Rs.25?
# Q7. Details of customer with heighest amount paid and he belong to which Job?
# Q8. Which city collected highest and lowest revenue?
# Q9. List of cities which are below average revenue collection?
# Q10. Convert date into weekday name?
# Q11. In which year there was a highest sale done and by which city?
# Q12. What is total quantity sold in a year in which highest revenue collected?

# 1.
select count(distinct product_id) as total_type_of_product from invoices;
-- Therefore, their are 100 type of product ID available.

# 2.
Select Product_id, round(sum(amount)) as Total_amount, count(qty) as Quantity_sold from invoices
group by product_ID
order by Total_amount asc;
-- Best selling product ID is 164 as it colected Rs.7,063 with 131 sold units. 
-- Lowest selling product ID is 106 as it colected Rs.3,738 with 74 sold units.

# 3.
Select First_name, email, amount, Job from invoices where product_id = 164;
-- List of peope with their job who belong to top revenue generator of Product_ID 164

# 4.
select first_name, email, amount, job from invoices where job = 'Economist';
-- List of peope who belong to Economist job title

# 5.
select first_name, email, amount, job from invoices where job Not IN ('Economist');
-- List of peope NOT belong to Economist job title
 
# 6.
select first_name, amount, qty, job from invoices where job = 'Economist' and amount < 25;
-- List of people how work as economist and their amount paid is less than Rs.25

# 7.
Select concat(first_name, " ", last_name) as Full_name, amount, job from invoices
order by amount desc; 
-- There are 3 person with highest amount paid and they belong to Press SUb, Psychotherapist and Lecturer respectively.

# 8. 
Select city, sum(amount) as Total_revenue_generated from invoices
group by city
order by Total_revenue_generated desc;
-- Lake James have highest revenue collection of Rs.778.43
-- South Kimberly have lowest revenue collection of Rs.5.01

# 9.
select first_name, amount from invoices
where amount < (select avg(amount) from invoices);
-- List of customers whose amount is less than average amount we revived in total. 

# 10.




# .
"Select date(invoice_date), sum(amount) as Total_revenue from invoices
group by invoice_date;"