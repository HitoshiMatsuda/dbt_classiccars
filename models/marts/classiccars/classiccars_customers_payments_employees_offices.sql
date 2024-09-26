with customers_payments_employees_source as (
    {{ config(schema='_classiccars_L2') }}
    select * from {{ ref('classiccars_customers_payments_employees') }}
),

offices_source as (
    {{ config(schema='_classiccars_L2') }}
    select * from {{ ref('classiccars_offices') }}
),


agg_cus_pay_emp as (
    SELECT
        officecode,
        SUM(amount) AS amount
    FROM (
        SELECT
            offi.officecode AS officecode,
            emp_amo.amount AS amount
        FROM
            customers_payments_employees_source AS emp_amo
        LEFT JOIN
            offices_source AS offi
        ON
            emp_amo.officecode = offi.officecode )
    GROUP BY
        officecode
    ORDER BY
        amount DESC
)

select * from agg_cus_pay_emp