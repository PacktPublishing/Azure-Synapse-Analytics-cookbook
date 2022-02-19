select top 10 *
from openrowset(
    bulk 'abfss://amazonbestseller@synapsecookbookdemo.dfs.core.windows.net/NYCTripSmall.parquet',
    format = 'parquet') as rows
