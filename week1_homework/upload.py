import pandas as pd
from sqlalchemy import create_engine

# Create dataframes
df_1 = pd.read_csv("./green_tripdata_2019-01.csv", sep=",")
df_2 = pd.read_csv("./taxi+_zone_lookup.csv", sep=",")

# Convert datetime column to date
df_1['lpep_pickup_datetime'] = pd.to_datetime(df_1['lpep_pickup_datetime']).dt.date
df_1['lpep_dropoff_datetime'] = pd.to_datetime(df_1['lpep_dropoff_datetime']).dt.date

# Connect to postgres database
engine = create_engine('postgresql://root:root@localhost:5432/db1')

# Upload dataframes to postgres database
df_1.to_sql('nytripdata', engine, if_exists="replace", index=False, chunksize=100000)
print("CHUNKS INSERTED")

df_2.to_sql('nytripzones', engine, if_exists="replace", index=False)
print("DONE")

