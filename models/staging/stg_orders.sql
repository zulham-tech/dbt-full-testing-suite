{{ config(materialized='view') }}

with source as (
    select * from {{ source('raw', 'orders') }}
),
renamed as (
    select
        order_id::varchar        as order_id,
        customer_id::varchar     as customer_id,
        order_date::date         as order_date,
        status::varchar          as status,
        amount::numeric(10,2)    as amount
    from source
    where order_id is not null
)
select * from renamed
