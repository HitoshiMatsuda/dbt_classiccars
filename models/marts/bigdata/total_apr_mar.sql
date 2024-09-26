with apr as (
    {{ config(schema='_bigdata_L2') }}
    select * from {{ ref('bigdata_APR') }}
),

mar as (
    {{ config(schema='_bigdata_L2') }}
    select * from {{ ref('bigdata_Mar') }}
),

union_tables as(
    SELECT * FROM apr
    union
    SELECT * FROM mar
)

SELECT * FROM union_tables