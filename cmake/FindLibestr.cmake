# - Try to find libestr
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  LIBESTR_INCLUDE_DIR    Set this variable to the root directory of
#                            liblognorm if the module has problems finding
#                            the proper path.
#
# Variables defined by this module:
#
#  LIBESTR_FOUND          System has liblognorm libraries and headers.
#  LIBESTR_LIBRARY        The liblognorm library
#  LIBESTR_INCLUDE_DIR    The location of liblognorm headers

find_library(LIBESTR_LIBRARY
    NAMES libestr
    HINTS lib64
)

find_path(LIBESTR_INCLUDE_DIR
    NAMES libestr.h
    PATH_SUFFIXES libestr
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Libestr DEFAULT_MSG
    LIBESTR_LIBRARY
    LIBESTR_INCLUDE_DIR
)

mark_as_advanced(
    LIBESTR_LIBRARY
    LIBESTR_INCLUDE_DIR
)
