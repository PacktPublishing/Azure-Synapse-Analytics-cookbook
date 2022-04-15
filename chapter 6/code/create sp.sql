CREATE PROCEDURE aml_model_procedure 
AS
BEGIN
SELECT
    CAST([VendorID] AS [varchar]) AS [VendorID],
    CAST([tpep_pickup_datetime] AS [varchar]) AS [tpep_pickup_datetime],
    CAST([tpep_dropoff_datetime] AS [varchar]) AS [tpep_dropoff_datetime],
    CAST([passenger_count] AS [varchar]) AS [passenger_count],
    CAST([trip_distance] AS [varchar]) AS [trip_distance],
    CAST([RateCodeID] AS [varchar]) AS [RatecodeID],
    CAST([store_and_fwd_flag] AS [varchar]) AS [store_and_fwd_flag],
    CAST([PULocationID] AS [varchar]) AS [PULocationID],
    CAST([DOLocationID] AS [varchar]) AS [DOLocationID],
    CAST([payment_type] AS [varchar]) AS [payment_type],
    CAST([extra] AS [varchar]) AS [extra],
    CAST([mta_tax] AS [varchar]) AS [mta_tax],
    CAST([tip_amount] AS [varchar]) AS [tip_amount],
    CAST([tolls_amount] AS [varchar]) AS [tolls_amount],
    CAST([improvement_surcharge] AS [varchar]) AS [improvement_surcharge],
    CAST([total_amount] AS [varchar]) AS [total_amount],
    CAST([congestion_surcharge] AS [varchar]) AS [congestion_surcharge]
INTO [NYTaxiSTG].[#Tripadf]
FROM [NYTaxiSTG].[Tripadf];
SELECT *
FROM PREDICT (MODEL = (SELECT [model] FROM aml_models WHERE [ID] = 'synapsewrkspac-yellow_tripdataml-20210927014551-Best:1'),
              DATA = [NYTaxiSTG].[#Tripadf],
              RUNTIME = ONNX) WITH ([variable1] [real])
END
GO
EXEC aml_model_procedure
