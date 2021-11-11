
Cortex Demand Shaping: Readme
=============================

= Required Permissions:

BigQuery: 
bigquery.admin OR bigquery.dataOwner OR bigquery.dataEditor

CloudComposer:
composer.admin

Cloud Storage:
storage.buckets.create

CloudFunctions:
cloudfunctions.admin OR cloudfunctions.developer


= Manifest:

ReadMe.txt
cortex_ML_sample.ipynb
cortex_ml_sample.py
major_us_cities_dma_codes.py
pos-ingest.py

DDL/
CortexBQViews.sql
CalendarDates.json
CatalogItems.json
Customers.json
DemandPlanItems.json
PointOfSalesRecords.json
SalesOrderItems.json
SearchTermTrends.json
WeatherData.json

Extractors/
IbpExtractor.py and IbpAirflow.py
TrendExtractor.py and TrendAirflow.py
WeatherExtractor.py and WeatherAirflow.py

Looker_Demo_Files/
	dashboards/
		alerts.txt
		forecast.txt
		syndicated.txt
		temperature.txt
		trends.txt
	models/
		model.txt
	views/
		???


= Instructions:

1) Create Dataset "Intelligence" from the BigQuery Cloud Console

2) Create the staging tables for weather, point-of-sale, and IBP
   in the "Foundation" layer:
   Create Table -> Enter table Name -> Edit as Text
   -> Cut-n-Paste the DDL in JSON format for the table into text box

3) Create the mapping views in the "Intelligence" layer by executing
   CortexBQViews.sql at the SQL prompt

4) Create CloudComposer tasks for daily Weather, Trends, and IBP
   uploads from the CloudComposer Cloud Console, using the scripts
   and DAGs in the Extractors subfolder.

5) Create a storage bucket for the Point-of-Sales uploads from the
   CloudStorage Cloud Console.

6) Set up a CloudFunction in the CloudFunctions Cloud Console.
   Select the "finalize" trigger on the bucket just created.
   Upload the code, and deploy the function.

7) Enable Colab Notebook at https://colab.sandbox.google.com/),
   upload the notebook "cortex_ML_sample.ipynb", then run it,
   using "RunTime -> Run all". 

8) Enable Looker dashboard 
