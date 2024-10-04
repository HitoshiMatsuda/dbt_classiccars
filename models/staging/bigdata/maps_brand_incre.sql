{{
    config(
        materialized='incremental',
        unique_key='maps_brand'
    )
}}

with source as (

    select * from {{ ref('maps_brand') }}

)

select * from source

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where last_updated_date > (select max(last_updated_date) from {{ this }})

{% endif %}