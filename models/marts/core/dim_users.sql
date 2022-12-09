WITH stg_sql_server_dbo_users AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_users') }}
    ),

renamed_casted AS (
    SELECT
        user_id
        , first_name
        , last_name
        , email
        , phone_number
        , address_id
    FROM stg_sql_server_dbo_users
    )

SELECT * FROM renamed_casted