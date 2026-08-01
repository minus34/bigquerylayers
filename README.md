# bigquerylayers 
QGIS plugin for importing data from BigQuery

![screenshot](screenshot.png)

## Install
This plugin requires an active (free tier or paid) subscription to Google Cloud Platform
1. Create a project using the [Google Cloud Console](https://console.cloud.google.com)
2. Install the Google Cloud SDK and authenticate with either:
   - `gcloud auth application-default login`
   - or the in-plugin browser flow, which will automatically invoke `gcloud auth application-default login --launch-browser` when the plugin detects missing application-default credentials
3. Install the BigQuery layers plugin using the QGIS plugin manager

## Development

1. Make sure you have an active GCP project and authenticated Google Cloud SDK
2. Clone this repo and symlink it to the QGIS plugins folder

* Mac: `ln -s ${PWD} ~/Library/"Application Support"/QGIS/QGIS4/profiles/default/python/plugins`


## Dependency compatibility
This repository now ships with a modern dependency manifest for current upstream library versions while remaining compatible with QGIS 4.0.

- Install the supported runtime set with:
  `python3 -m pip install -r requirements.txt`
- For editable development usage, the project also exposes a `pyproject.toml` metadata file and a `pytest`-compatible dev extra.
- When updating the vendored `libs/` bundle, prefer the same current package set and keep the plugin import path stable under QGIS 4.0.

## Updating bundled Google Cloud libs
`python3 -m pip install --target libs --upgrade google-cloud-bigquery google-auth google-api-core google-cloud-core google-resumable-media requests urllib3 protobuf six`

## Python runtime target
This repository is prepared for Python 3.10+ compatibility and modern library packaging. If you are testing outside the bundled `libs/` path, prefer a Python 3.12 environment for the most current runtime behavior. QGIS 4.0 remains the supported plugin target, so the codebase intentionally uses the current `qgis.PyQt` imports rather than older QGIS 3-era legacy shims.
