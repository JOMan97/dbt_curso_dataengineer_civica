{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'products') }}
    ),

renamed_casted AS (
    SELECT
          md5(product_id) as product_id 
        , product_id as product_id_natural 
        , price
        , name
        , inventory
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

    SELECT * FROM renamed_casted