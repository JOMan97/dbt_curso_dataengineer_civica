WITH stg_sql_server_dbo_events AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_events') }}
    ),

renamed_casted AS (
    SELECT
        event_id
        , event_id_natural
        , event_type_natural
        , product_id
        , session_id
        , created_at
        , user_id
    FROM stg_sql_server_dbo_events
    )

SELECT * FROM renamed_casted