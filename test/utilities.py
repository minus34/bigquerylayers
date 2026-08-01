# coding=utf-8
"""Common functionality used by regression tests."""

import os
import sys
import logging


LOGGER = logging.getLogger('QGIS')
QGIS_APP = None  # Static variable used to hold hand to running QGIS app
CANVAS = None
PARENT = None
IFACE = None


def _load_qgis_test_components():
    """Import QGIS/Qt components in a way that survives both old and new layouts."""
    try:
        from qgis.PyQt import QtCore
        from qgis.PyQt.QtWidgets import QWidget
        from qgis.core import QgsApplication
        from qgis.gui import QgsMapCanvas
        from .qgis_interface import QgisInterface
        return QtCore, QWidget, QgsApplication, QgsMapCanvas, QgisInterface
    except Exception:
        try:
            from qgis.PyQt import QtGui, QtCore
            QWidget = QtGui.QWidget
            from qgis.core import QgsApplication
            from qgis.gui import QgsMapCanvas
            from .qgis_interface import QgisInterface
            return QtCore, QWidget, QgsApplication, QgsMapCanvas, QgisInterface
        except Exception:
            return None, None, None, None, None


def get_qgis_app():
    """Start one QGIS application to test against.

    The helper now tolerates both legacy and QGIS 4 import layouts and avoids
    forcing GUI-only startup side effects in environments where QGIS is not
    fully installed.

    :returns: Handle to QGIS app, canvas, iface and parent. If there are any
        errors the tuple members will be returned as None.
    :rtype: (QgsApplication, CANVAS, IFACE, PARENT)

    If QGIS is already running the handle to that app will be returned.
    """

    QtCore, QWidget, QgsApplication, QgsMapCanvas, QgisInterface = _load_qgis_test_components()
    if any(component is None for component in (QtCore, QWidget, QgsApplication, QgsMapCanvas, QgisInterface)):
        return None, None, None, None

    global QGIS_APP  # pylint: disable=W0603

    if QGIS_APP is None:
        gui_flag = True  # All test will run qgis in gui mode
        #noinspection PyPep8Naming
        QGIS_APP = QgsApplication(sys.argv, gui_flag)

        prefix_path = os.environ.get('QGIS_PREFIX_PATH')
        if prefix_path:
            QGIS_APP.setPrefixPath(prefix_path, True)

        # Make sure QGIS_PREFIX_PATH is set in your env if needed!
        QGIS_APP.initQgis()

    global PARENT  # pylint: disable=W0603
    if PARENT is None:
        #noinspection PyPep8Naming
        PARENT = QWidget()

    global CANVAS  # pylint: disable=W0603
    if CANVAS is None:
        #noinspection PyPep8Naming
        CANVAS = QgsMapCanvas(PARENT)
        CANVAS.resize(QtCore.QSize(400, 400))

    global IFACE  # pylint: disable=W0603
    if IFACE is None:
        # QgisInterface is a stub implementation of the QGIS plugin interface
        #noinspection PyPep8Naming
        IFACE = QgisInterface(CANVAS)

    return QGIS_APP, CANVAS, IFACE, PARENT
