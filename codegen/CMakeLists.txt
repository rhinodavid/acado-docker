#
# Project settings
#

# Minimum required version of cmake
CMAKE_MINIMUM_REQUIRED( VERSION 2.8 )

# Project name and programming languages used
PROJECT( ACADO_CODE_GENERATOR CXX )

# CMake module(s) path
SET( CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR} )

#
# Prerequisites
#
FIND_PACKAGE( ACADO REQUIRED )

#
# Include directories
#
INCLUDE_DIRECTORIES( . ${ACADO_INCLUDE_DIRS} )

#
# Build an executable
#
ADD_DEFINITIONS( -std=c++11 )
ADD_EXECUTABLE( generator generator.cpp  )
# Linux and OS X
TARGET_LINK_LIBRARIES( generator ${ACADO_SHARED_LIBRARIES} )
SET_TARGET_PROPERTIES( generator
                       PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} )
