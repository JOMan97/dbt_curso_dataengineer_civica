WITH stg_sql_server_dbo_order_items AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_order_items') }}
    ),

renamed_casted AS (
    SELECT
        order_id
        , order_id_natural
        , product_id
        , product_id_natural
        , quantity
    FROM stg_sql_server_dbo_order_items
    )

SELECT * FROM renamed_casted