
CREATE EXTERNAL TABLE gold.clustered_data
WITH (
    LOCATION = 'ml/data_parquet/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM OPENROWSET(
    BULK 'https://worldbglobal.dfs.core.windows.net/gold/cluster/data_parquet/',
    FORMAT = 'PARQUET'
) AS rows;
