cmake_minimum_required( VERSION 3.0 FATAL_ERROR )
set( CMAKE_VERBOSE_MAKEFILE ON )

project( sample )
set( APP_NAME "${PROJECT_NAME}App" )

get_filename_component( CINDER_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../" ABSOLUTE )

get_filename_component( APP_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../" ABSOLUTE )

set( APP_SRCS
	${APP_DIR}/src/sampleApp.cpp
)
set( APP_INCS
	${APP_DIR}/include
)

include( "${CINDER_PATH}/proj/cmake/modules/cinderMakeApp.cmake" )

ci_make_app(
	APP_NAME ${APP_NAME}
	SOURCES ${APP_SRCS}
	INCLUDES ${APP_INCS}
	CINDER_PATH ${CINDER_PATH}
	BLOCKS Cinder-MIDI2
)

if( APPLE )
	add_custom_target( run
		COMMAND open ${CMAKE_BUILD_TYPE}/${APP_NAME}/${APP_NAME}.app
		DEPENDS ${CMAKE_BUILD_TYPE}/${APP_NAME}/${APP_NAME}.app/Contents/MacOS/${APP_NAME}
		WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
		)
endif()
