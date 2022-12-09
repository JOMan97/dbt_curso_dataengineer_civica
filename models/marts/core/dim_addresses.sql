WITH stg_sql_server_dbo_addresses AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_addresses') }}
    ),

renamed_casted AS (
    SELECT
        address_id
        , country
        , zipcode
        , address
        , state
        , date_load
    FROM stg_sql_server_dbo_addresses
    )

SELECT * FROM renamed_casted