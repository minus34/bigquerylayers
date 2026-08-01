#!/usr/bin/env bash

# restart environment
conda activate qgis4_dev

# add path to rcc compiler
export PATH="/Users/hughsaalmans/miniconda3/envs/qgis4_dev/lib/python3.12/site-packages/PySide6/Qt/libexec:$PATH"

# compile plugin
cd /Users/hughsaalmans/git/minus34/bigquerylayers
pb_tool compile
