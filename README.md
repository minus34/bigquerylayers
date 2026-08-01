# bigquerylayers 
QGIS plugin for importing data from BigQuery

![screenshot](screenshot.png)

## Install
This plugin requires an active (free tier or paid) subscription to Google Cloud Platform
1. Create a project using the [Google Cloud Console](https://console.cloud.google.com)
2. Install the Google Cloud SDK and authenticate using the command  `gcloud auth application-default login`
3. Install the BigQuery layers plugin using the QGIS plugin manager

## Development

1. Make sure you have an active GCP project and authenticated Google Cloud SDK
2. Clone this repo and symlink it to the QGIS plugins folder

* Mac: `ln -s ${PWD} ~/Library/"Application Support"/QGIS/QGIS4/profiles/default/python/plugins`


## Updating bundled Google Cloud libs
`python3 -m pip install --target libs --upgrade google-cloud-bigquery google-auth google-api-core google-cloud-core google-resumable-media requests urllib3 protobuf six`

## Python runtime target
This repository is prepared for Python 3.12-compatible bundled dependencies and modern library packaging. If you are testing outside the bundled `libs/` path, prefer a Python 3.12 environment for the most current runtime behavior.
