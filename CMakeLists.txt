cmake_minimum_required (VERSION 3.9)
project (FreeRTOS C)
set(globalLibName "FreeRTOS")

set(myGlobalSourceDir ${CMAKE_CURRENT_SOURCE_DIR})

# define CMAKE_INSTALL_PREFIX and CMAKE_PREFIX_PATH in crossconfig.cmake
include(crossconfig.cmake OPTIONAL)

# set standard build type
if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE Release CACHE STRING
		"Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
		FORCE)
endif(NOT CMAKE_BUILD_TYPE)

include(CMake/MicroprocessorSpecific.cmake)
include(CMake/FreeRTOSConfig.cmake)
include(CMake/FreeRTOSConfigDependencies.cmake)

configure_file("CMake/FreeRTOSConfig.h.in" "FreeRTOSConfig.h" @ONLY)

list(APPEND myHeaderFiles "${CMAKE_CURRENT_BINARY_DIR}/FreeRTOSConfig.h")

option(Compile_Queue "Compile queue.c" OFF)
option(Compile_Timers "Compile timers.c" OFF)
option(Compile_EventGroups "Compile event_groups.c" OFF)
set (Compile_Heap_Model "1" CACHE STRING "Compile heapx.c, set to 0 for your own memory allocation")

add_subdirectory (include)
add_subdirectory (source)

message(STATUS "myHeaderFiles:" "${myHeaderFiles}")
message(STATUS "myIncludeDirs:" "${myIncludeDirs}")
message(STATUS "mySourceFiles:" "${mySourceFiles}")

include_directories(include)
include_directories("${CMAKE_CURRENT_BINARY_DIR}")
include_directories("${myIncludeDirs}")

add_library(${globalLibName} ${mySourceFiles})

include(CheckIPOSupported)
check_ipo_supported(RESULT result)
if(result)
	set_property(TARGET ${globalLibName} PROPERTY INTERPROCEDURAL_OPTIMIZATION True)
endif()

target_compile_options(${globalLibName} PUBLIC -Wall -Wextra -Wmissing-prototypes -Wstrict-prototypes -c -std=gnu99)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
	set (CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -gdwarf-2")
endif (CMAKE_BUILD_TYPE STREQUAL "Debug")

install(TARGETS ${globalLibName} DESTINATION lib)
install(FILES ${myHeaderFiles} DESTINATION include/FreeRTOS)
