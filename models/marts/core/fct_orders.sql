WITH stg_sql_server_dbo_orders AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_orders') }}
    ),

renamed_casted AS (
    SELECT
        order_id
        , shipping_service
        , shipping_cost
        , address_id
        , promo_id
        , created_at
        , estimated_delivery_at
        , order_cost
        , order_total
        , user_id
        , delivered_at
        , tracking_id
        , status
        , date_load
    FROM stg_sql_server_dbo_orders
    )

SELECT * FROM renamed_casted