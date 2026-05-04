# Registro de Cargas Diarias (Logs)

El pipeline fue ejecutado durante días consecutivos para validar la ingesta automatizada.

* **Ejecución 1 (Carga Inicial):** Ingesta del histórico completo de BTC, ETH, SOL y ADA. Ejecución de `dbt run --full-refresh`.
* **Ejecución 2:** Ingesta del primer CSV diario. Los modelos procesaron correctamente solo los registros nuevos (`status: LOADED`).
* **Ejecución 3:** Pruebas de calidad. Ejecución de `dbt test` pasando exitosamente las validaciones de unicidad y no nulidad.
* **Ejecución 4:** Ingesta de `solana_sec_ing.csv`. La tabla de hechos incrementó su conteo de filas sin duplicar registros anteriores.

**Resolución de problemas:** Durante el desarrollo, se detectó que el esquema en estrella inicial generaba filtros ambiguos en Power BI. Se resolvió dividiendo el modelo en una Constelación de Hechos, centralizando la dimensión temporal en `STG_DATE`.