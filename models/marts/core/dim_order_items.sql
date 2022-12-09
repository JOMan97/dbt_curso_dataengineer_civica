WITH stg_sql_server_dbo_order_items AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_order_items') }}
    ),

renamed_casted AS (
    SELECT
        order_id
        , product_id
        , quantity
    FROM stg_sql_server_dbo_order_items
    )

SELECT * FROM renamed_casted