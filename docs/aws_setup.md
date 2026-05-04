# Configuración AWS S3 y Snowflake

Para habilitar la automatización de cargas, se configuró la siguiente infraestructura:

1. **AWS S3 Bucket:** Creación del bucket `crypto-dbt-daily-feed` en la región correspondiente.
2. **IAM Policy & Role:** Creación de un rol con permisos `s3:GetObject` y `s3:ListBucket`.
3. **Snowflake Storage Integration:** Configuración de un objeto de integración vinculando el ARN del rol de AWS.
4. **External Stage:** Creación del stage `@ext_s3_stage` apuntando a la ruta del bucket para facilitar el comando `COPY INTO`.

*(Nota: Las credenciales y claves de acceso reales han sido excluidas de este repositorio por motivos de seguridad, siguiendo el archivo .gitignore).*