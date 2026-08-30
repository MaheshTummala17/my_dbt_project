select
    r.review_id,
    r.order_id,
    r.user_id as customer_id,
    safe_cast(r.restaurant_id as string) as restaurant_id,
    r.rating,
    r.comment,
    r.review_date,
    res.city as city,
from {{ source('raw', 'reviews') }} r
left join {{ ref('stg_restaurants') }} res on r.restaurant_id = res.restaurant_id
where r.comment is not null