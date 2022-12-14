{{ config(
    materialized='table'
    ) 
    }}


WITH stg_budget_products AS (
    SELECT * 
    FROM {{ source('google_sheets','budget') }}
    ),

renamed_casted AS (
    SELECT
        md5(_row) as id_budget
        , _row as _row_natural 
        , month
        , quantity
        , md5(product_id) as product_id
        , _fivetran_synced
    FROM stg_budget_products
    )

SELECT * FROM renamed_casted

