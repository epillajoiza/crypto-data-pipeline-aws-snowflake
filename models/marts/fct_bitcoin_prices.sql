{{
  config(
    materialized='incremental',
    unique_key='price_timestamp',
    schema='marts'
  )
}}

with precios_limpios as (
    select * from {{ ref('stg_bitcoin_prices') }}
),

calculos_negocio as (
    select
    1 as coin_key,
        price_timestamp,
        date(price_timestamp) as price_date,
        open_price,
        high_price,
        low_price,
        close_price,
        volume_btc,
        (high_price - low_price) as volatilidad,
        
        current_timestamp() as insertion_at
        
    from precios_limpios

    {% if is_incremental() %}
      where price_timestamp > (select max(price_timestamp) from {{ this }})
    {% endif %}
)

select * from calculos_negocio