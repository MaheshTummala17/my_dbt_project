select
    order_item_id, 
    order_id, 
    r_id as restaurant_id, 
    f_id, 
    round(safe_cast(price as numeric),2) as price, 
    quantity, 
    round(safe_cast(line_amount as numeric),2) as  line_amount
from {{source('raw','order_items')}}