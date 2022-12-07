{% snapshot snapshots_sql_server_dbo_orders %}

{{
    config(
      target_schema='snapshots',
      unique_key='order_id',
      strategy='check',
      check_cols=['status'],
      invalidate_hard_deletes=True,
        )
}}

select * from {{ source('src_sql_server_dbo', 'orders') }}

{% endsnapshot %}