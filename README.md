# Crypto Analytics - End-to-End Data Pipeline 🚀

## 📝 Descripción del Proyecto
Este proyecto es un pipeline de datos completo (End-to-End) diseñado para ingerir, transformar y analizar información diaria del mercado de criptomonedas (Bitcoin, Ethereum, Solana, Cardano). El objetivo es centralizar datos de precios y volúmenes de transacciones para extraer *insights* financieros en un dashboard interactivo.

## 🏗️ Arquitectura Tecnológica
El proyecto utiliza un *Modern Data Stack*:
1. **AWS S3:** Almacenamiento en la nube (Data Lake) para los feeds diarios en formato CSV.
2. **Snowflake:** Data Warehouse en la nube para ingesta (`COPY INTO`) y almacenamiento de las capas analíticas.
3. **dbt Core:** Herramienta de transformación para modelado dimensional (Staging y Marts) y cargas incrementales.
4. **Power BI:** Herramienta de visualización conectada en modo *DirectQuery* para análisis en tiempo real.

## 📊 Modelado de Datos
Se ha implementado una arquitectura de **Constelación de Hechos** para evitar relaciones recursivas y optimizar el análisis:
* **Tablas de Hechos:** `FCT_BITCOIN_PRICES` (histórico de precios) y `STG_TRADES` (transacciones diarias).
* **Dimensiones Compartidas:** `STG_DATE` (calendario), `STG_COINS` (criptomonedas) y `STG_EXCHANGES` (plataformas de intercambio).

## ⚙️ Instrucciones de Ejecución
1. Configurar la integración segura entre AWS S3 y Snowflake (`Storage Integration`).
2. Ejecutar los scripts DDL en Snowflake para crear el esquema `RAW` y el `External Stage`.
3. Instalar dependencias de dbt: `dbt deps`.
4. Ejecutar el pipeline completo: `dbt run` (la carga inicial puede requerir `--full-refresh`).