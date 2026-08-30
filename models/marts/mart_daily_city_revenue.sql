select
    order_date,
    city,
    count(*) as orders,
    countif(is_delivered) as delivered_orders,
    round(safe_divide(countif(order_status='cancelled'),count(*)),4) as cancel_rate,
    sum(if(is_delivered,sales_amount,0)) as gmv,
    ROUND(
        SAFE_DIVIDE(
            SUM(IF(is_delivered, sales_amount, 0)),
            COUNTIF(is_delivered)
        ),
        2
    ) AS aov
from {{ref("fact_orders")}}
group by 1,2