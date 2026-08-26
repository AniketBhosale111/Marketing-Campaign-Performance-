SELECT TOP (1000) [JourneyID]
      ,[CustomerID]
      ,[ProductID]
      ,[VisitDate]
      ,[Stage]
      ,[Action]
      ,[Duration]
  FROM [PortfolioProject_MarketingAnalytics].[dbo].[customer_journey]
  use PortfolioProject_MarketingAnalytics;

  select distinct stage Collate SQL_Latin1_General_cp1_CS_AS --cs case sensitive
  from dbo.customer_journey;

  select distinct stage from dbo.customer_journey;

  select distinct stage Collate SQL_Latin1_General_cp1_CI_AS --CI not case sensitive
  from dbo.customer_journey;

  use PortfolioProject_MarketingAnalytics
  --current collation of database 
  select  DATABASEPROPERTYEX('PortfolioProject_MarketingAnalytics','collation')as collation
  
  use PortfolioProject_MarketingAnalytics;

  --identify and tag duplicate records

  --clean and standrdize the data 

  --imput null with avg_duration

  select *from customer_journey;

  select upper(stage)as stage 
  from dbo.customer_journey;

  -- count null value 

  select count(*)as total_rows,
  count(duration)as notnull_rows,
  count(*)-count(duration)as null_rows
  from dbo.customer_journey;

  select count(*) from customer_journey
  where duration is null;
  


  select  count(duration)as not_null,count(*)as total from dbo.customer_journey;
  
  --average duration for each date

  select avg(duration)as avg_duration
  from dbo.customer_journey;

  --query duration  for each date

  select JourneyID,
         CustomerID,
         ProductID,
         visitdate,
         upper(Stage)as stage,
         Action,Duration,
         avg(duration)over(partition by visitdate) as avg_duration
  from dbo.customer_journey;

  --finding duplicate record 

  select stage,count(*)from dbo.customer_journey
  group by stage 
  having count(*)>1 ;

  with cleaned_data as(

  select JourneyID,
         CustomerID,
         ProductID,
         visitdate,
         upper(Stage)as stage,action,
         coalesce(duration,avg(duration) over(partition by visitdate)) as clean_duration--replace null with average duration
         --finding duplicate record
         ,row_number()over
         (partition by CustomerID,ProductID,visitdate,stage,Action order by JourneyID)as row_num
         from dbo.customer_journey )
select * from cleaned_data where row_NUM=1











         
         
  select JourneyID,
         CustomerID,
         ProductID,
         visitdate,
         upper(Stage)as stage,action,
         ROW_NUMBER()over
         (partition by CustomerID,ProductID,visitdate,stage,action order by JourneyID) as row_num
         from dbo.customer_journey;
         

  select count(*)as total
  from dbo.customer_journey
  where duration is null;

  select Stage,Action ,COUNT(*)
  from customer_journey
  group by stage,Action
  having COUNT(*)>1

  select count(productID)as cs,Action,stage from customer_journey
  group by Stage,Action