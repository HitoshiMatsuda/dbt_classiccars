with source as (
    {{ config(schema='L1') }}
    select * from {{ source('classiccars', 'EMPLOYEES') }}
),

renamed as (
    select
        EMPLOYEENUMBER,
        LASTNAME,
        FIRSTNAME,
        EXTENSION,
        EMAIL,
        OFFICECODE,
        REPORTSTO,
        JOBTITLE
    from source
)
select * from renamed