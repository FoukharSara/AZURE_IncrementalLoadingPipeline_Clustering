SELECT *
FROM 
    OPENROWSET(
        BULK 'https://worldbglobal.dfs.core.windows.net/silver/cleaneddata/data_parquet/',
        FORMAT = 'PARQUET'
    )as query1
