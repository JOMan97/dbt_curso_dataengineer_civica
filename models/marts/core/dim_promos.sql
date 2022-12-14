WITH stg_sql_server_dbo_promos AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_promos') }}
    ),

renamed_casted AS (
    SELECT
        promo_id
        , promo_id_natural
        , status
        , discount
    FROM stg_sql_server_dbo_promos
    )

SELECT * FROM renamed_casted