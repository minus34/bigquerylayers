#!/usr/bin/env bash

conda deactivate

# --------------------------------------------------------------------------------------------------------------------

GITHUB_FOLDER="/Users/$(whoami)/git/minus34"

# PYTHON_EXECUTABLE="/Applications/QGIS.app/Contents/MacOS/python"

# --------------------------------------------------------------------------------------------------------------------

# install pipx & cookiecutter
brew install pipx
pipx install cookiecutter

cd $GITHUB_FOLDER

# create new repository from cookiecutter template
cookiecutter https://github.com/GispoCoding/cookiecutter-qgis-plugin

# Here's the next steps you should take:
cd bigquery-layers-3
python create_qgis_venv.py
source .venv/bin/activate
python -m pip install -U pip
pip install pip-tools
pip-compile requirements-dev.in
pip install -r requirements-dev.txt





# # --------------------------------------------------------------------------------------------------------------------

# REPO_FOLDER="/Users/$(whoami)/git/minus34/bigquerylayers"

# PYTHON_EXECUTABLE="/Applications/QGIS.app/Contents/MacOS/python"

# # --------------------------------------------------------------------------------------------------------------------

# cd $REPO_FOLDER

# export QGIS_PREFIX="/Applications/QGIS.app/Contents/MacOS"
# export PYTHONHOME=$QGIS_PREFIX
# export PYTHONPATH="$QGIS_PREFIX/../Resources/python3.11"
# export DYLD_FRAMEWORK_PATH="/Applications/QGIS.app/Contents/Frameworks"
# export PATH="/Applications/QGIS.app/Contents/Frameworks/bin:$PATH"

# # export PYTHONPATH="/Applications/QGIS.app/Contents/Resources/python3.11:/Applications/QGIS.app/Contents/Resources/python3.11/site-packages"

# # install pip
# $PYTHON_EXECUTABLE -m ensurepip --default-pip

# # install/upgrade installer packages
# $PYTHON_EXECUTABLE -m pip install pip setuptools wheel

# # install this plugin's prerequisites
# $PYTHON_EXECUTABLE -m pip install contourpy. # misssing dependency for matplotlib 3.8.1
# $PYTHON_EXECUTABLE -m pip install -r requirements.txt

# #install plugin developer packages
# $PYTHON_EXECUTABLE -m pip install PyQt5 pyqt5-tools pb_tool

# # PySide5 ptvsd debugpy pytest

# # $PYTHON_EXECUTABLE -m pip install binascii
