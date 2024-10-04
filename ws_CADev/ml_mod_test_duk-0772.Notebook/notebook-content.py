# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "d447426f-8f18-48ed-ab21-b40c0e04ea3a",
# META       "default_lakehouse_name": "lh_ws_test_schreibzugriff",
# META       "default_lakehouse_workspace_id": "267b72ee-c00d-4561-a2f2-4d27f3f479cf",
# META       "known_lakehouses": [
# META         {
# META           "id": "d447426f-8f18-48ed-ab21-b40c0e04ea3a"
# META         },
# META         {
# META           "id": "350ffc08-80f5-4d9d-82f3-6a19e27a45d4"
# META         },
# META         {
# META           "id": "cc6a6350-60b9-4254-8ac8-7213fc0711d4"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

from mlflow import MlflowClient
client = MlflowClient()
client.create_model_version(
        name="ml_mod_test_duk",
        source=<"your-model-source-path">,
        run_id=<"your-run-id">
    )

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
