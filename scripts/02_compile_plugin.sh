#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------------------------

REPO_FOLDER="/Users/$(whoami)/git/minus34/bigquerylayers"

PYTHON_EXECUTABLE="/Applications/QGIS.app/Contents/MacOS/python"

# --------------------------------------------------------------------------------------------------------------------

conda deactivate

cd $REPO_FOLDER

export QGIS_PREFIX="/Applications/QGIS.app/Contents/MacOS"
export PYTHONHOME=$QGIS_PREFIX
export PYTHONPATH="$QGIS_PREFIX/../Resources/python3.11"
export DYLD_FRAMEWORK_PATH="/Applications/QGIS.app/Contents/Frameworks"
export PATH="/Applications/QGIS.app/Contents/Frameworks/bin:$PATH"

# add path to rcc compiler
# export PATH="/Users/$(whoami)/miniconda3/envs/qgis4_dev/lib/python3.11/site-packages/PySide6/Qt/libexec:$PATH"

# compile plugin
/Applications/QGIS.app/Contents/Frameworks/bin/pb_tool compile
