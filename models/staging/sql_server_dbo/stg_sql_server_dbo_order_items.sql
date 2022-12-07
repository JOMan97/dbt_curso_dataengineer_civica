{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'order_items') }}
    ),


    renamed_casted AS (
    SELECT
          md5(order_id) as order_id 
        , order_id as order_id_natural 
        , md5(product_id) as product_id 
        , product_id as product_id_natural 
        , quantity
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

    SELECT * FROM renamed_casted