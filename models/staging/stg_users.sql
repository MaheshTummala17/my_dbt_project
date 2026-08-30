select
    safe_cast(user_id as integer) as customer_id,
    name as customer_name,
    lower(email) as email,
    safe_cast(age as integer) as age,
    gender,
    marital_status,
    occupation,
    monthly_income as income_band,
    education,
    safe_cast(family_size as integer) as family_size
from {{source('raw','users')}}
where safe_cast(user_id as integer) is not null