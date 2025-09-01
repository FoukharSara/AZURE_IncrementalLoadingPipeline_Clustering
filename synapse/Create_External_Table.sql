--- Master Key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Pass@Azure'

--- Credential
CREATE DATABASE SCOPED CREDENTIAL cred_wdi
WITH 
    IDENTITY = 'Managed Identity'


--- Data Source
-- #Silver
CREATE EXTERNAL DATA SOURCE source_silver
WITH(
    LOCATION = 'https://worldbglobal.blob.core.windows.net/silver',
    CREDENTIAL = cred_wdi
) 
-- #Gold
CREATE EXTERNAL DATA SOURCE source_gold
WITH(
    LOCATION = 'https://worldbglobal.blob.core.windows.net/gold',
    CREDENTIAL = cred_wdi
) 


---- Format
Create EXTERNAL FILE FORMAT format_parquet
WITH(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

--- CETAS Create Externale Table As Select
---- ###########  Country  ###########
CREATE EXTERNAL TABLE gold.country_dim
WITH(
    LOCATION = 'country',
    DATA_SOURCE = source_gold,
    FILE_FORMAT= format_parquet
)AS
SELECT * FROM gold.dim_country

SELECT * FROM gold.country_dim


---- ###########  Indicator  ###########
CREATE EXTERNAL TABLE gold.indicator_dim
WITH(
    LOCATION = 'indicator',
    DATA_SOURCE = source_gold,
    FILE_FORMAT= format_parquet
)AS
SELECT * FROM gold.dim_indicator

SELECT * from gold.indicator_dim


---- ###########  Facts  ###########
CREATE EXTERNAL TABLE gold.facts_table
WITH(
    LOCATION = 'facts',
    DATA_SOURCE = source_gold,
    FILE_FORMAT= format_parquet
)AS
SELECT * FROM gold.fact_values

SELECT COUNT(*) FROM gold.facts_table


