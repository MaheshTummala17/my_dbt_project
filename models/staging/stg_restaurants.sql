select
    safe_cast(id as integer) as restaurant_id,
    name as restaurant_name,
    trim(coalesce(regexp_extract(city, '[^,]+$'),city)) as city,
    safe_cast(NULLIF(rating,'--') as numeric) as rating,
    safe_cast(regexp_extract(rating_count,'[0-9]+') as integer) as rating_count,
    safe_cast(regexp_extract(cost,'[0-9]+') as integer) as cost_for_two,
    cuisine,
    lic_no as license_no,
from {{source('raw','restaurants')}}
where  safe_cast(id as integer) is not null