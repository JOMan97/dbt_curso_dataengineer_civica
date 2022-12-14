WITH stg_sql_server_dbo_products AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_products') }}
    ),

renamed_casted AS (
    SELECT
        product_id
        , product_id_natural
        , price
        , name
        , inventory
    FROM stg_sql_server_dbo_products
    )

SELECT * FROM renamed_casted