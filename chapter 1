CREATE SCHEMA [NYCTaxi];
IF NOT EXISTS (SELECT * FROM sys.objects WHERE NAME = 'TripsStg' AND TYPE = 'U')
CREATE TABLE [NYCTaxi].[TripsStg]
	(
	 VendorID nvarchar(30),
	 tpep_pickup_datetime nvarchar(30),
	 tpep_dropoff_datetime nvarchar(30),
	 passenger_count nvarchar(30),
	 trip_distance nvarchar(30),
	 RatecodeID nvarchar(30),
	 store_and_fwd_flag nvarchar(30),
	 PULocationID nvarchar(30),
	 DOLocationID nvarchar(30),
	 payment_type nvarchar(30),
	 fare_amount nvarchar(10),
	 extra nvarchar(10),
	 mta_tax nvarchar(10),
	 tip_amount nvarchar(10),
	 tolls_amount nvarchar(10),
	 improvement_surcharge nvarchar(10),
	 total_amount nvarchar(10)
	)
WITH
	(
	DISTRIBUTION = ROUND_ROBIN,
	 HEAP
	)
GO

Use COPY INTO Command to load the data from the ADLS2. This helps in reducing multiple steps in data load process and the complexity.

COPY INTO [NYCTaxi].[TripsStg]
FROM 'https://mystorageaccount.blob.core.windows.net/myblobcontainer/*.csv'
WITH
(
	
    FILE_TYPE = 'CSV',
	CREDENTIAL=(IDENTITY= 'Shared Access Signature', SECRET= '<Your_Account_Key>'),
	FIELDTERMINATOR = ',',
	FIELDQUOTE = '"',
	ROWTERMINATOR='0X0A',
	ENCODING = 'UTF8',
    	DATEFORMAT = 'ymd',
	MAXERRORS =20,
	ERRORFILE = '/errorslogfolder',--path starting from the storage container
	IDENTITY_INSERT = 'OFF'
	)
GO
