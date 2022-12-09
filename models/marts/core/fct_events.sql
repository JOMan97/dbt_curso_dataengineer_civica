WITH stg_sql_server_dbo_events AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_events') }}
    ),

renamed_casted AS (
    SELECT
        event_id
        , event_type
        , product_id
        , order_id
        , session_id
        , created_at
        , user_id
    FROM stg_sql_server_dbo_events
    )

SELECT * FROM renamed_casted