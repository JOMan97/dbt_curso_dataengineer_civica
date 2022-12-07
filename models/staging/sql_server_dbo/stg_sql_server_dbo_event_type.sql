{{
  config(
    materialized='view'
  )
}}

WITH sql_server_dbo AS (
    SELECT DISTINCT event_type
    FROM {{ source('src_sql_server_dbo', 'events') }}
    ),

renamed_casted AS (
    SELECT
          md5(event_type) as event_type 
        , event_type as event_type_natural
    FROM sql_server_dbo
)

SELECT * FROM renamed_casted