cmake_minimum_required (VERSION 3.9)
PROJECT (libFreeRTOS C)

IF(NOT CMAKE_BUILD_TYPE)
  SET(CMAKE_BUILD_TYPE Release CACHE STRING
      "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
      FORCE)
ENDIF(NOT CMAKE_BUILD_TYPE)

SET(LIBNAME "FreeRTOS")

include(CheckIPOSupported)
check_ipo_supported(RESULT result)
if(result)
#  set_property(TARGET ${LIBNAME} PROPERTY INTERPROCEDURAL_OPTIMIZATION True)
endif()

if(DEFINED MCU_LIB_PATH)
#install(TARGETS hd44780 ARCHIVE DESTINATION ${MCU_LIB_PATH}/lib)
#install(FILES ${incfiles} DESTINATION "${MCU_LIB_PATH}/include")
endif(DEFINED MCU_LIB_PATH)

if(CMAKE_SYSTEM_PROCESSOR STREQUAL "atmega88")
include_directories(lib/FreeRTOS/portable/GCC/AVR)
endif(CMAKE_SYSTEM_PROCESSOR STREQUAL "atmega88")

include(CMake/FreeRTOSConfig.cmake)
include_directories(lib/include lib/include/private)
configure_file(CMake/FreeRTOSConfig.h.in FreeRTOSConfig.h @ONLY)
configure_file(CMake/FreeRTOSExternProvided.h.in FreeRTOSExternProvided.h @ONLY)
include_directories(${CMAKE_CURRENT_BINARY_DIR})

set(MANDATORY_SOURCE_FILES lib/FreeRTOS/tasks.c lib/FreeRTOS/list.c)

add_library(${LIBNAME} ${MANDATORY_SOURCE_FILES})
