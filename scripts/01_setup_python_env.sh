#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------------------------

PYTHON_EXECUTABLE="/Applications/QGIS-final-4_2_0.app/Contents/MacOS/python"
PYTHONPATH="/Applications/QGIS-final-4_2_0.app/Contents/Resources/python3.12"
# PYTHON_VERSION="3.12"

# --------------------------------------------------------------------------------------------------------------------

conda deactivate

export PYTHONHOME=/Applications/QGIS-final-4_2_0.app/Contents/MacOS
export PYTHONPATH=/Applications/QGIS-final-4_2_0.app/Contents/Resources/python3.12

# install pip
$PYTHON_EXECUTABLE -m ensurepip --default-pip

# install/upgrade installer packages
$PYTHON_EXECUTABLE -m pip install pip setuptools wheel

# install this plugin's prerequisites
$PYTHON_EXECUTABLE -m pip install -r /Users/$(whoami)/git/minus34/bigquerylayers/requirements.txt

#install plugin developer packages
$PYTHON_EXECUTABLE -m pip install PyQt6 qt6-tools PySide6 pb_tool ptvsd debugpy pytest
