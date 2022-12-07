{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'addresses') }}
    ),

renamed_casted AS (
    SELECT
          md5(address_id) as address_id 
        , address_id as address_id_natural 
        , country
        , zipcode
        , address
        , state
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )
    SELECT * FROM renamed_casted