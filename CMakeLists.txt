
cmake_minimum_required(VERSION 2.8)

project(Plugin)

include(BroPlugin)

find_package(Liblognorm)
find_package(LibFastJSON)
find_package(Libestr)

if ( LIBLOGNORM_FOUND AND LIBFASTJSON_FOUND AND LIBESTR_FOUND )
	message(STATUS "Liblognorm header prefix   : ${LIBLOGNORM_INCLUDE_DIR}")
	message(STATUS "Liblognorm library path    : ${LIBLOGNORM_LIBRARY}")
	message(STATUS "LibFastJSON header prefix  : ${LIBFASTJSON_INCLUDE_DIR}")
	message(STATUS "LibFastJSON library path   : ${LIBFASTJSON_LIBRARY}")
	message(STATUS "Libestr header prefix      : ${LIBESTR_INCLUDE_DIR}")
	message(STATUS "Libestr library path       : ${LIBESTR_LIBRARY}")

	include_directories(${LIBLOGNORM_INCLUDE_DIR})
	include_directories(${LIBFASTJSON_INCLUDE_DIR})
	include_directories(${LIBESTR_INCLUDE_DIR})

	bro_plugin_begin(Bro Lognorm)
	bro_plugin_cc(src/Plugin.cc)
	bro_plugin_cc(src/LogNormalizer.cc)
	bro_plugin_bif(src/lognorm.bif)
	bro_plugin_dist_files(README CHANGES COPYING VERSION)
	bro_plugin_link_library(${LIBLOGNORM_LIBRARY})
	bro_plugin_link_library(${LIBFASTJSON_LIBRARY})
	bro_plugin_link_library(${LIBESTR_LIBRARY})
	bro_plugin_end()
else ()
	message(FATAL_ERROR "Build failed:")
	if ( NOT LIBLOGNORM_FOUND )
		message(FATAL_ERROR "Liblognorm not found.")
	endif ()
	if ( NOT LIBFASTJSON_FOUND )
		message(FATAL_ERROR "LibFastJSON not found.")
	endif ()
	if ( NOT LIBESTR_FOUND )
		message(FATAL_ERROR "Libestr not found.")
	endif ()
endif ()
