#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------------------------

REPO_FOLDER="/Users/$(whoami)/git/minus34/bigquerylayers"

PYTHON_EXECUTABLE="/Applications/QGIS-final-4_2_0.app/Contents/MacOS/python"

# --------------------------------------------------------------------------------------------------------------------

conda deactivate

cd $REPO_FOLDER

export PYTHONHOME="/Applications/QGIS-final-4_2_0.app/Contents/MacOS"
export PYTHONPATH="/Applications/QGIS-final-4_2_0.app/Contents/Resources/python3.12:/Applications/QGIS-final-4_2_0.app/Contents/Resources/python3.12/site-packages"

# install pip
$PYTHON_EXECUTABLE -m ensurepip --default-pip

# install/upgrade installer packages
$PYTHON_EXECUTABLE -m pip install pip setuptools wheel

# install this plugin's prerequisites
$PYTHON_EXECUTABLE -m pip install -r requirements.txt

#install plugin developer packages
$PYTHON_EXECUTABLE -m pip install PyQt6 qt6-tools PySide6 pb_tool ptvsd debugpy pytest


$PYTHON_EXECUTABLE -m pip install binascii