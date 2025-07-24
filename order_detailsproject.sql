# view the order_details table
select * from order_details;
# What is the date range of the table 
select * from order_details
order by order_date;
#2nd way to know rang 
select min(order_date)as min_date,max(order_date)as max_date from order_details;
# how many orders were made within the date range
select count(distinct order_id)from order_details;
select count(*)from order_details;
#how many items were ordered within this date range
select count(*) from order_details where order_date between '2023-01-01' and '2023-03-31';
# which order had the most number  of items
select order_id ,count(order_id)as num_items from order_details
group by order_id
order by num_items desc;
#How many orders had more than 12  items
select order_id,count(item_id) as num_items from order_details 
group by order_id
 having num_items>12;
 
 #get how many items in id 12
  select count(*) from
  (select order_id,count(item_id)as num_items from order_details
  group by order_id
  having num_items>12) as num_orders;
