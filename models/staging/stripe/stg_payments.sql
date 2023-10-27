with payments as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        {{ cents_to_dollars('amount') }},
        status

    from {{ source('stripe', 'payment') }}

)

select * from payments