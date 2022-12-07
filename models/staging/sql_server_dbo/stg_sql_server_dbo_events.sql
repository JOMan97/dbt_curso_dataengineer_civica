{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'events') }}
    ),

renamed_casted AS (
    SELECT
            md5(event_id) as event_id 
        , event_id as event_id_natural 
        , case
         when product_id = '' then null
         else  product_id
         end as product_id
        , page_url
        ,case
         when order_id = '' then null
         else  order_id
         end as order_id
        , session_id
        , created_at
        , md5(user_id) as user_id 
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )
    
SELECT * FROM renamed_casted
