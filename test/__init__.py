# Import qgis only when the runtime is available so the test harness remains
# usable in environments that do not ship the full QGIS Python bindings.
try:
    import qgis  # pylint: disable=W0611  # NOQA
except ImportError:
    qgis = None