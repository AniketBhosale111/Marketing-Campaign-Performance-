SELECT TOP (1000) [ReviewID]
      ,[CustomerID]
      ,[ProductID]
      ,[ReviewDate]
      ,[Rating]
      ,[ReviewText]
  FROM [PortfolioProject_MarketingAnalytics].[dbo].[customer_reviews]
  use PortfolioProject_MarketingAnalytics;
  select*from customer_reviews;

  select ReviewID,CustomerID,ProductID,ReviewDate,Rating,replace(reviewText,'  ',' ')
  from dbo.customer_reviews;