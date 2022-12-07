{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'promos') }}
    ),

renamed_casted AS (
    SELECT
          md5(promo_id) as promo_id 
        , promo_id as promo_id_natural 
        , status
        , discount
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted