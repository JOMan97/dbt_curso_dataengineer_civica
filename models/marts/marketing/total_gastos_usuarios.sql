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
        , sum(orders.order_total) :: decimal(20,2) as total_gastos_usuarios
    FROM dim_users dim_users join orders orders
        on dim_users.user_id = orders.user_id
    group by dim_users.user_id, dim_users.first_name, dim_users.last_name
    order by 4 desc
    )

SELECT * FROM renamed_casted