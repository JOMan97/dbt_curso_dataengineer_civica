{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'users') }}
    ),

renamed_casted AS (
    SELECT
          md5(user_id) as user_id 
        , user_id as user_id_natural 
        , md5(address_id) as address_id
        , first_name
        , last_name
        , created_at
        , cast(replace(phone_number,'-', '') as int) as phone_number
        , email
        , updated_at
        , total_orders
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted
