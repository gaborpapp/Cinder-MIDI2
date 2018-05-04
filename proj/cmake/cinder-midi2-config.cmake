if ( NOT TARGET Cinder-MIDI2 )
	get_filename_component( CINDER_MIDI2_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE )

	set( CINDER_MIDI2_INCLUDES
		${CINDER_MIDI2_PATH}/include/
		${CINDER_MIDI2_PATH}/lib/
	)

	set( CINDER_MIDI2_SOURCES
		${CINDER_MIDI2_PATH}/src/MidiHub.cpp
		${CINDER_MIDI2_PATH}/src/MidiIn.cpp
		${CINDER_MIDI2_PATH}/src/MidiMessage.cpp
		${CINDER_MIDI2_PATH}/src/MidiOut.cpp
		${CINDER_MIDI2_PATH}/lib/RtMidi.cpp
	)

	add_library( Cinder-MIDI2 ${CINDER_MIDI2_SOURCES} )
	target_compile_options( Cinder-MIDI2 PUBLIC "-std=c++11" )

	target_include_directories( Cinder-MIDI2 PUBLIC "${CINDER_MIDI2_INCLUDES}" )
	target_include_directories( Cinder-MIDI2 SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )

    if( NOT TARGET cinder )
        include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
        find_package( cinder REQUIRED PATHS
            "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
            "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
    endif()
	target_link_libraries( Cinder-MIDI2 PRIVATE cinder )
endif()
