select
    city,
    EXTRACT(HOUR FROM order_timestamp) AS order_hour,
    COUNT(*) AS delivered_orders,
    ROUND(
        APPROX_QUANTILES(delivery_time_min, 100)[OFFSET(50)],
        1
    ) AS p50,
    ROUND(
        APPROX_QUANTILES(delivery_time_min, 100)[OFFSET(90)],
        1
    ) AS p90

from {{ref("fact_orders")}}
WHERE is_delivered
GROUP BY 1, 2