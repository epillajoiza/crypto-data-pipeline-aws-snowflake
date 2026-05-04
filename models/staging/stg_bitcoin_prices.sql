with btc_hist as (
    select 
        1 as coin_key, -- Bitcoin
        to_timestamp(timestamp_unix) as price_timestamp,
        cast(replace(open_price, ',', '.') as float) as open_price,
        cast(replace(high_price, ',', '.') as float) as high_price,
        cast(replace(low_price, ',', '.') as float) as low_price,
        cast(replace(close_price, ',', '.') as float) as close_price,
        cast(replace(volume_btc, ',', '.') as float) as volume_btc
    from {{ source('RAW', 'STG_BITCOIN_PRICES') }}
),

btc_daily as (
    select 
        1 as coin_key, -- Bitcoin
        to_timestamp(timestamp_unix) as price_timestamp, 
        cast(replace(open_price, ',', '.') as float) as open_price,
        cast(replace(high_price, ',', '.') as float) as high_price,
        cast(replace(low_price, ',', '.') as float) as low_price,
        cast(replace(close_price, ',', '.') as float) as close_price,
        cast(replace(volume_btc, ',', '.') as float) as volume_btc
    from {{ source('RAW', 'RAW_BITCOIN_DAILY') }}
),

eth_daily as (
    select 
        2 as coin_key, -- Ethereum
        to_timestamp(timestamp_unix) as price_timestamp, 
        cast(replace(open_price, ',', '.') as float) as open_price,
        cast(replace(high_price, ',', '.') as float) as high_price,
        cast(replace(low_price, ',', '.') as float) as low_price,
        cast(replace(close_price, ',', '.') as float) as close_price,
        cast(replace(volume_btc, ',', '.') as float) as volume_btc
    from {{ source('RAW', 'RAW_ETHEREUM_DAILY') }}
),

sol_daily as (
    select 
        3 as coin_key, -- Solana
        to_timestamp(timestamp_unix) as price_timestamp, 
        cast(replace(open_price, ',', '.') as float) as open_price,
        cast(replace(high_price, ',', '.') as float) as high_price,
        cast(replace(low_price, ',', '.') as float) as low_price,
        cast(replace(close_price, ',', '.') as float) as close_price,
        cast(replace(volume_btc, ',', '.') as float) as volume_btc
    from {{ source('RAW', 'RAW_SOLANA_DAILY') }}
),

ada_daily as (
    select 
        4 as coin_key, -- Cardano
        to_timestamp(timestamp_unix) as price_timestamp, 
        cast(replace(open_price, ',', '.') as float) as open_price,
        cast(replace(high_price, ',', '.') as float) as high_price,
        cast(replace(low_price, ',', '.') as float) as low_price,
        cast(replace(close_price, ',', '.') as float) as close_price,
        cast(replace(volume_btc, ',', '.') as float) as volume_btc
    from {{ source('RAW', 'RAW_CARDANO_DAILY') }}
),

union_todas_las_monedas as (
    select * from btc_hist
    union all
    select * from btc_daily
    union all
    select * from eth_daily
    union all
    select * from sol_daily
    union all
    select * from ada_daily
)

select * from union_todas_las_monedas