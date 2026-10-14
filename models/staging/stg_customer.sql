with source as (
    select * from {{ source('olist','customers')}}
),

renamed as (
    select customer_id, customer_unique_id, lpad(to_varchar(customer_zip_code_prefix), 5, '0') as zip_code_prefix,
    initcap(customer_city) as city,
    upper(customer_state) as state 
    from source
)

select * from renamed