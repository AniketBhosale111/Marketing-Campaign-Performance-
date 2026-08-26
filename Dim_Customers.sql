SELECT TOP (1000) [CustomerID]
      ,[CustomerName]
      ,[Email]
      ,[Gender]
      ,[Age]
      ,[GeographyID]
  FROM [MarketingAnalytics].[dbo].[customers];

  use PortfolioProject_MarketingAnalytics;
 select c.CustomerID,c.CustomerName,c.Email,c.Gender,g.Country,g.City
 from dbo.customers c
 left join dbo.geography g
 on c.GeographyID=g.GeographyID;

