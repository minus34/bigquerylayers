#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------------------------

REPO_FOLDER="/Users/$(whoami)/git/minus34/bigquerylayers"

PYTHON_EXECUTABLE="/Applications/QGIS-final-4_2_0.app/Contents/MacOS/python"

# --------------------------------------------------------------------------------------------------------------------

conda deactivate

cd $REPO_FOLDER

export PYTHONHOME="/Applications/QGIS-final-4_2_0.app/Contents/MacOS"
export PYTHONPATH="/Applications/QGIS-final-4_2_0.app/Contents/Resources/python3.12:/Applications/QGIS-final-4_2_0.app/Contents/Resources/python3.12/site-packages"
export PATH="/Applications/QGIS-final-4_2_0.app/Contents/Frameworks/bin:$PATH"

# add path to rcc compiler
# export PATH="/Users/$(whoami)/miniconda3/envs/qgis4_dev/lib/python3.12/site-packages/PySide6/Qt/libexec:$PATH"

# compile plugin
/Applications/QGIS-final-4_2_0.app/Contents/Frameworks/bin/pb_tool compile
