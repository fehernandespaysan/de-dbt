with payments as (

    select
        ID as payment_id,
        ORDERID as order_id,
        PAYMENTMETHOD as payment_method,
        STATUS as payment_status,
        {{cents_to_dollars('AMOUNT',4)}} as payment_amount,
        created as payment_created,
        _batched_at
from {{ source('stripe', 'payment') }}

)

select * from payments