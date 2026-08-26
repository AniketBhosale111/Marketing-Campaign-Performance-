use PortfolioProject_MarketingAnalytics;
SELECT TOP (1000) [EngagementID]
      ,[ContentID]
      ,[ContentType]
      ,[Likes]
      ,[EngagementDate]
      ,[CampaignID]
      ,[ProductID]
      ,[ViewsClicksCombined]
  FROM [MarketingAnalytics].[dbo].[engagement_data];

  -- Data Cleaning
  -- clean and normalize the engagement table

select EngagementID, ContentID,CampaignID,ProductID,
upper(replace(ContentType,'Socialmedia','Social Media')) as ContentType,
left(ViewsClicksCombined,CHARINDEX('-',ViewsClicksCombined)-1) as Views,
right(ViewsClicksCombined,len(ViewsClicksCombined)-CHARINDEX('-',ViewsClicksCombined)) as Clicks,
Likes,
format(convert(DATE,EngagementDate),'dd.MM.yyyy') as EngagementDate
from dbo.engagement_data
where ContentType != 'Newsletter'



-- all the other content except newsletter