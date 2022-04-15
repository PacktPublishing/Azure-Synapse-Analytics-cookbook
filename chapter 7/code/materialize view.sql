CREATE materialized view matViewGrossAmount WITH (DISTRIBUTION=HASH([LocationID])) AS
SELECT d.[Borough]
,d.[LocationID]
,d.[Zone]
,d.[service_zone]
,SUM(f.[total_amount])as Gross_Total
 FROM [dbo].[dim_taxizone] d 
 INNER JOIN
 dbo.[TripsStg] f on d.[LocationID] = f.[PULocationID]
 group by d.[LocationID]
,d.[Borough]
,d.[Zone]
,d.[service_zone]
