{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'orders') }}
    ),

renamed_casted AS (
    SELECT
            md5(order_id) as order_id 
        , order_id as order_id_natural 
        , case
          when shipping_service = '' then null
          else  shipping_service
          end as shipping_service
        , shipping_cost
        , md5(address_id) as address_id
        , created_at
        , case
          when promo_id = '' then null
          else  md5(promo_id)
          end as promo_id
        , estimated_delivery_at
        , order_cost
        , md5(user_id) as user_id 
        , order_total
        , delivered_at
        , case
          when tracking_id = '' then null
          else  tracking_id
          end as tracking_id
        , status
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted