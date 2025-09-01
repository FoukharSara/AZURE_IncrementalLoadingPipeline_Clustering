CREATE TABLE water_table(
 last_load VARCHAR(2000)
)
ALTER TABLE [dbo].[wbi_table]
ALTER COLUMN variable VARCHAR(MAX);

INSERT INTO [dbo].[water_table] VALUES (2023)

SELECT COUNT(*) FROM [dbo].[wbi_table] WHERE CAST(variable AS INT) >= 2023;

