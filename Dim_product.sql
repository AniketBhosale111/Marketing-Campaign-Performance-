use PortfolioProject_MarketingAnalytics;
SELECT TOP (1000) [ProductID]
      ,[ProductName]
      ,[Category]
      ,[Price]
  FROM [MarketingAnalytics].[dbo].[products];

-- Categorise the product based on their price , price < 50 , LOW , 50 - 200 Medium , otherwise high


select ProductID,ProductName,Category,Price,
CASE 
  WHEN Price <50 THEN 'Low'
  WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
  ELSE 'High'
END as PriceCategory
from dbo.products;

