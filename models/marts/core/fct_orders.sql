with
    orders as (
        select * from {{ ref('stg_orders') }}
    )

    , payments as (
        select * from {{ ref('stg_payments') }}
    )

    , successful_payments as (
        select * from payments
        where status='success'
    )

    , grouped_payments as (
        select 
            order_id
            , sum(amount) as amount 
        from successful_payments
        group by order_id
    )

    , orders_joined_payments_amount as (
        select a.*
            , coalesce(b.amount, 0) as amount
        from orders as a 
            left join grouped_payments as b
                on a.order_id = b.order_id
        
    )

select *, sum(amount) over () as sum_amount from orders_joined_payments_amount