SELECT
    trade_id AS trade_key,
    trade_timestamp,
    DATE(trade_timestamp) AS trade_date,
    coin_id AS coin_key,
    exchange_id AS exchange_key,
    price AS trade_price_usd,
    amount AS trade_amount_crypto,
    (price * amount) AS total_volume_usd
FROM {{ source('RAW', 'FCT_TRADES') }}