# combine the menu_items and order_details table in a single table
select * from menu_items;
select * from order_details;
select * from 
order_details od 
left join menu_items mi
on od.item_id=mi.menu_item_id;

# what are the least and most  order items? what category were they  in
select item_name,count(order_details_id) as num_purchases
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name
order by num_purchases;
# Most demanded
select item_name, category,count(order_details_id) as num_purchases
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name,category
order by num_purchases desc;
#what were the top 5 order that spend most money?
select order_id,sum(price) as total_spend
 from order_details od 
left join menu_items mi
on od.item_id=mi.menu_item_id
group by order_id
order by total_spend desc
limit 5;
# view the details of the highest spend order what insight you were gather from
select * from order_details od 
left join menu_items mi
on od.item_id=mi.menu_item_id
where order_id =440;
 # which category they order most
select category,count(item_id)as num_item from order_details od 
left join menu_items mi
on od.item_id=mi.menu_item_id
where order_id =440
group by  category;
# view the details of the top 5 highest spend order what insight u will gather  
select category,count(item_id) as num_item from order_details od 
left join menu_items mi
on od.item_id=mi.menu_item_id
where order_id in(440,2075,1957,330,2675)
group by category;

select order_id,category,count(item_id) as num_item from order_details od 
left join menu_items mi
on od.item_id=mi.menu_item_id
where order_id in(440,2075,1957,330,2675)
group by order_id,category;
