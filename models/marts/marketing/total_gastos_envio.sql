WITH dim_users AS (
    SELECT * 
    FROM {{ ref('dim_users') }}
    ),

    orders as ( SELECT * 
    FROM {{ ref('fct_orders') }}
    ),

renamed_casted AS (
    SELECT
          dim_users.user_id
        , first_name
        , last_name
        , SUM(orders.shipping_cost) :: decimal(20,2) AS total_gasto_envio
    FROM dim_users dim_users join orders orders
        on dim_users.user_id = orders.user_id
    group by dim_users.user_id, dim_users.first_name, dim_users.last_name
    order by 4 desc
    )

SELECT * FROM renamed_casted