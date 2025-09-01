--- Create country dimension (Distinct)
CREATE VIEW gold.dim_country AS
SELECT DISTINCT 
    Country_Code,
    Country_Name,
    Short_Name,
    Region,
    Income_Group,
    Currency_Unit
FROM gold.wdidata


--- Create indicators dimension (Distinct)
CREATE VIEW gold.dim_indicator AS 
SELECT DISTINCT 
    Indicator_Code,
    Indicator_Name,
    Topic,
    Unit
FROM gold.wdidata

--- CREATE Fact 
CREATE VIEW gold.fact_values AS
SELECT 
    Country_Code,
    Indicator_Code,
    CAST(Year AS INT) AS Years,
    CAST(Value AS DECIMAL(38,2)) AS Value
FROM gold.wdidata

SELECT DISTINCT Years
FROM gold.fact_values



