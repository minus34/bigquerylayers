#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------------------------

ENV_NAME=qgis4_dev
PYTHON_VERSION="3.12"

# --------------------------------------------------------------------------------------------------------------------

echo "-------------------------------------------------------------------------"
echo "Creating new Conda Environment '${ENV_NAME}'"
echo "-------------------------------------------------------------------------"

# deactivate current environment and start base env (in case you just deactivated it) - lazy method
conda deactivate
conda activate base

# WARNING - removes existing environment
conda env remove -y --name ${ENV_NAME}

# update Conda
yes | conda update --all

# Create Conda environment
conda create -y -n ${ENV_NAME} python=${PYTHON_VERSION}

# activate and setup env
conda activate ${ENV_NAME}
#conda env config vars set JAVA_HOME="/opt/homebrew/opt/openjdk@11"
conda config --env --add channels conda-forge
conda config --env --set channel_priority strict

# reactivate for env vars to take effect
conda activate ${ENV_NAME}

# install QGIS -- not 4.x
# conda install -c conda-forge qgis

# install packages
pip install --upgrade pip
pip install setuptools
pip install PyQt6
pip install PySide6 pyqt6-tools pb_tool ptvsd debugpy pytest

# clear cache (builds over time)
conda clean -y --all
