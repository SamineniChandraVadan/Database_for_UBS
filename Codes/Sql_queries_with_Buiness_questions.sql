

--1.What is their best channel of sales on a given day (12/1/2021)?
select s.date, c.channel_type, sum(sale_amount) as Total_Sales
from sales s, channel c
where c.channel_id=s.channel_id
group by channel_type
order by Total_sales desc







--2.What is the impact of promotions on different items? (Case taken: Christmas discount)

SELECT a.promotion_id, b.item_id, b.item_description, sum(c.quantity) as tot_quantity, sum(c.quantity*b.price) as sales
FROM (
SELECT promotion_id, item_id
FROM promotion_item
) a
LEFT JOIN (
SELECT item_id, item_description, price
FROM item
) b ON a.item_id = b.item_id
inner JOIN (
SELECT item_id, `Item Qty` as quantity
FROM item_order
) c ON a.item_id = c.item_id
where promotion_id = "Christams2020"
group by a.promotion_id, b.item_id, b.item_description order by tot_quantity desc limit 5;








--3.What price buckets work best in each category?

select a.category_id,category_name, Price_bucket, sum(quantity)
from (
select a.category_id, category_name,
case when Price between 0 and 5 then '0 to 5'
when Price between 6 and 10 then '6 to 10'
when Price between 11 and 20 then '11 to 20'
when Price between 21 and 40 then '21 to 40'
when Price between 41 and 60 then '41 to 60'
else '>60' end as price_bucket,  quantity from item_category a left join item b on a.category_id = b.category_id
left join
item_sales c ON b.item_id = c.item_id) a group by a.category_id,category_name, Price_bucket;






--4.How each employee performed over a given period? (Performance measured by number of orders processed/revenue generated by the employee)

select employee_id, sum(sale_amount) as total_employee_revenue, Count(order_id) as
num_orders_performed
from sales
where CONVERT(DATE, Date)  > "2021-01-01"
group by employee_id
Order By total_employee_revenue  Desc limit 5;







--5.Who are the critical vendors? (If for the supply of a particular item, the store relies on only one vendor, then because of the high dependency such a vendor, the vendor gets classified as a critical one)

select vendor_id
from (
select item_id, count(distinct vendor_id) as unique_vendors
from inventory
join item_inventory on inventory.inv_order_id = item_inventory.inv_order_id
group by item_id
Having unique_vendors =1
) A inner join
(
select item_id, vendor_id
from inventory
join item_inventory on inventory.inv_order_id = item_inventory.inv_order_id
group by item_id, vendor_id
) B on A.item_id = B.item_id
group by vendor_id ;






--6.What is the quantity of items available in the store on a given day?

select A.item_id, (inv_qty_order - total_sales_qty) as current_inventory_avalibale
from
(select item_id, sum(qty) as inv_qty_order
from item_inventory
group by item_id ) A
inner join
(select item_id, sum(quantity) as total_sales_qty
from item_sales
group by item_id ) B
on A.item_id = B.item_id order by (inv_qty_order - total_sales_qty) desc limit 5  ;





--7.Which are the most running items in the store?

select item_id, sum(quantity) as total_qty
from
(select *
from sales
where CONVERT(DATE, Date) Between '2021-11-01' and '2021-12-01' ) A
inner join
(select *
from item_sales
) B on A.order_Id = B.order_Id
group by item_id
Order By total_qty Desc
Limit 5;





--8. Who are our loyal customers?

SELECT `customer_id` , customer_names.name, COUNT( `customer_id` ) AS `most_frequent_employees`
FROM (SELECT sales.order_id, sales.customer_id, customer.name
FROM sales
INNER JOIN customer ON customer.customer_id = sales.customer_id) customer_names
GROUP BY `customer_id`
ORDER BY `most_frequent_employees` DESC
LIMIT 3;
--9. How does the market basket of some of the top customers look like?
 select customer_id, item_id
from item_sales
join
(
select A.customer_id, order_id
from
(
Select customer_id, order_id
from sales
group by customer_id, order_id) A
inner join
(
select customer_id ,  COUNT( `customer_id` ) as most_frequent_customers
FROM (SELECT sales.order_id, sales.customer_id, customer.name
FROM sales
INNER JOIN customer ON customer.customer_id = sales.customer_id) customer_names
GROUP BY customer_id
ORDER BY most_frequent_customers DESC
LIMIT 10
) B on A.customer_id = B.customer_id
) C on C.order_id = item_sales.order_id limit 5;
--10.  Which is the most profitable channel?
select B.channel_id, sum(cost_incurred * Price) as total_cost_incurred, sum(Price) as total_revenue_from_channel
from
(select *
from sales
where CONVERT(DATE, Date) Between '2021-11-01' and '2021-12-01'  ) A
left join
(select channel_id, cost_incurred/100 as cost_incurred
from chand137.channel ) B on A.Channel_Id = B.channel_id
group by channel_id;




