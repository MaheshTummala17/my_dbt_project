select
    menu_id, 
    SAFE_CAST(r_id as INTEGER) as restaurant_id, 
    f_id, 
    cuisine, 
    ROUND(SAFE_CAST(price AS NUMERIC), 2) as price
from {{source('raw','menu')}}
where SAFE_CAST(r_id as INTEGER) is not null and 
      ROUND(SAFE_CAST(price AS NUMERIC), 2) > 0