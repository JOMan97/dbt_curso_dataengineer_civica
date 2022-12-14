WITH stg_sql_server_dbo_event_type AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_event_type') }}
    ),

renamed_casted AS (
    SELECT
        event_type
        , event_type_natural
    FROM stg_sql_server_dbo_event_type
    )

SELECT * FROM renamed_casted