with payments as (

    select
        ORDERID as order_id,
        PAYMENTMETHOD as payment_method,
        STATUS as payment_status,
        AMOUNT as payment_amount,
        created as payment_created,
        _batched_at
from {{ source('stripe', 'payment') }}

)

select * from payments