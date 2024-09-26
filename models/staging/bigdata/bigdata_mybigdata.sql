with source as (
    select * from {{ source('bigdata', 'MYBIGDATA') }}
),

trans_double as (
    select
        EVENT_TIME ,
        EVENT_TYPE ,
        PRODUCT_ID ,
        CATEGORY_ID ,
        CATEGORY_CODE ,
        BRAND ,
        CAST(PRICE AS float) AS PRICE ,
        USER_ID ,
        USER_SESSION 
    from source
)
select * from trans_double