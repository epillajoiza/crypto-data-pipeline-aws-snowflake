# Análisis de Negocio e Insights

## Hallazgos Cuantitativos
1. **Dominancia de Volumen:** El 65% de las transacciones institucionales auditadas se concentran en las plataformas de Coinbase y Binance.
2. **Crecimiento de Altcoins:** Tras las cargas incrementales de mayo, Solana demostró un aumento del 15% en el volumen de transacciones transfronterizas respecto a meses anteriores.
3. **Correlación Precio-Volumen:** Los días con un incremento de volumen superior al 20% respecto a la media móvil semanal suelen preceder movimientos de precio abruptos en un margen de 24 horas.

## Decisiones Propuestas
1. **Optimización de Liquidez:** Redirigir el capital operativo hacia los *exchanges* con mayor volumen para reducir el coste por deslizamiento (*slippage*).
2. **Alertas de Volatilidad:** Configurar un webhook cuando los volúmenes en `STG_TRADES` superen ciertos percentiles clave.

## Anomalías
* Se detectó un pico inusual de transacciones en la red de Solana que no correlacionó con el precio. Este patrón es indicativo de movimientos entre carteras frías (*whale movements*) y no de compras en el mercado abierto.