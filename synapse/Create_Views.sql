CREATE VIEW gold.wdidata 
AS 
SELECT 
    *
FROM 
    OPENROWSET
    (
        BULK 'https://worldbglobal.blob.core.windows.net/silver/cleaneddata/data_parquet/',
        FORMAT ='PARQUET'
    ) as Query2

SELECT * FROM gold.wdidata