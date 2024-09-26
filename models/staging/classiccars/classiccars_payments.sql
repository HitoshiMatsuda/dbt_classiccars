with source as (
    {{ config(schema='_classiccars_L1') }}
    select * from {{ source('classiccars', 'PAYMENTS') }}
),

renamed as (
    select
        CUSTOMERNUMBER,
        CHECKNUMBER,
        PAYMENTDATE,
        AMOUNT
    from source
)
select * from renamed