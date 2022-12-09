WITH stg_sql_server_dbo_order_items AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_order_items') }}
    ),

renamed_casted AS (
    SELECT
        order_id
        , product_id
        , quantity
        , created_at_utc
        , updated_at_utc
        , date_load
    FROM stg_sql_server_dbo_order_items
    )

SELECT * FROM renamed_casted