SELECT
    coin_id AS coin_key,
    symbol AS coin_symbol,
    name AS coin_name,
    algorithm AS mining_algorithm
FROM {{ source('RAW', 'DIM_COIN') }}