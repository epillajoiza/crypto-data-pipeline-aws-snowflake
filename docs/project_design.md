# Diseño del Proyecto: Crypto Pipeline

## 1. Dominio y Problemática
El mercado de criptomonedas es altamente volátil. Este proyecto busca unificar el volumen de transacciones de distintos *exchanges* con el histórico de precios para detectar patrones de mercado.

## 2. Preguntas Analíticas
1. ¿Cómo impacta el volumen de transacciones en la volatilidad de criptomonedas como Solana o Bitcoin?
2. ¿Qué plataforma (Binance, Coinbase, Kraken) concentra el mayor volumen operativo diario?
3. ¿Cuál es la tendencia de transacciones semanales identificada mediante la carga incremental?

## 3. Estrategia Incremental
* **Fuente:** Archivos CSV simulando *daily feeds* depositados en un bucket de AWS S3.
* **Lógica:** Se utiliza la macro `is_incremental()` de dbt filtrando por `TRADE_DATE`. Solo los registros con fecha posterior a la última ejecución (`MAX(TRADE_DATE)`) se insertan en las tablas finales.