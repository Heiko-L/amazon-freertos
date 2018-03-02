cmake_minimum_required (VERSION 3.9)
project (libFreeRTOS C)

# define CMAKE_INSTALL_PREFIX and CMAKE_PREFIX_PATH in crossconfig.cmake
include(crossconfig.cmake OPTIONAL)

# set standard build type
if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE Release CACHE STRING
		"Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
		FORCE)
endif(NOT CMAKE_BUILD_TYPE)

set(LIBNAME "FreeRTOS")

include(CMake/MicroprocessorSpecific.cmake)
include(CMake/FreeRTOSConfig.cmake)
include(CMake/FreeRTOSConfigDependencies.cmake)

#
# mandatory files
#
set(MANDATORY_SOURCE_FILES source/tasks.c source/list.c)

set(INSTALL_HEADERS ${INSTALL_HEADERS} include/FreeRTOS.h)
set(INSTALL_HEADERS ${INSTALL_HEADERS} include/task.h)
set(INSTALL_HEADERS_PRIV ${INSTALL_HEADERS_PRIV} include/private/list.h)

configure_file(CMake/FreeRTOSConfig.h.in FreeRTOSConfig.h @ONLY)
configure_file(CMake/FreeRTOS_uc.h.in FreeRTOS_uc.h @ONLY)
configure_file(CMake/FreeRTOSExternProvided.h.in FreeRTOSExternProvided.h @ONLY)

set(INSTALL_HEADERS ${INSTALL_HEADERS} ${CMAKE_CURRENT_BINARY_DIR}/FreeRTOSConfig.h)
set(INSTALL_HEADERS ${INSTALL_HEADERS} ${CMAKE_CURRENT_BINARY_DIR}/FreeRTOS_uc.h)
set(INSTALL_HEADERS ${INSTALL_HEADERS} ${CMAKE_CURRENT_BINARY_DIR}/FreeRTOSExternProvided.h)

set(INSTALL_HEADERS_PRIV ${INSTALL_HEADERS_PRIV} lib/include/private/deprecated_definitions.h)

set(INSTALL_HEADERS_PRIV ${INSTALL_HEADERS_PRIV} lib/include/private/mpu_wrappers.h)
set(INSTALL_HEADERS_PRIV ${INSTALL_HEADERS_PRIV} lib/include/private/portable.h)
set(INSTALL_HEADERS_PRIV ${INSTALL_HEADERS_PRIV} lib/include/private/projdefs.h)
set(INSTALL_HEADERS_PRIV ${INSTALL_HEADERS_PRIV} lib/include/private/stack_macros.h)

include_directories(${CMAKE_CURRENT_BINARY_DIR} include)

option(Compile_Queue "Compile queue.c" OFF)
option(Compile_Timers "Compile timers.c" OFF)
option(Compile_EventGroups "Compile event_groups.c" OFF)
set (Compile_Heap_Model "1" CACHE STRING "Compile heapx.c, set to 0 for your own memory allocation")

if (Compile_Queue)
	set(OPTIONAL_SOURCE_FILES ${OPTIONAL_SOURCE_FILES} lib/FreeRTOS/queue.c)
	set(INSTALL_HEADERS ${INSTALL_HEADERS} lib/include/queue.h)
	set(INSTALL_HEADERS ${INSTALL_HEADERS} lib/include/semphr.h)
endif (Compile_Queue)

if (Compile_Timers)
	set(OPTIONAL_SOURCE_FILES ${OPTIONAL_SOURCE_FILES} lib/FreeRTOS/timers.c)
	set(INSTALL_HEADERS ${INSTALL_HEADERS} lib/include/timers.h)
endif (Compile_Timers)

if (Compile_EventGroups)
	set(OPTIONAL_SOURCE_FILES ${OPTIONAL_SOURCE_FILES} lib/FreeRTOS/event_groups.c)
	set(INSTALL_HEADERS ${INSTALL_HEADERS} lib/include/event_groups.h)
endif (Compile_EventGroups)

if (Compile_Heap_Model STREQUAL "1")
	set(OPTIONAL_SOURCE_FILES ${OPTIONAL_SOURCE_FILES} source/port/MemMang/heap_1.c)
elseif (Compile_Heap_Model STREQUAL "2")
	set(OPTIONAL_SOURCE_FILES ${OPTIONAL_SOURCE_FILES} source/port/MemMang/heap_2.c)
elseif (Compile_Heap_Model STREQUAL "3")
	set(OPTIONAL_SOURCE_FILES ${OPTIONAL_SOURCE_FILES} source/port/MemMang/heap_3.c)
elseif (Compile_Heap_Model STREQUAL "4")
	set(OPTIONAL_SOURCE_FILES ${OPTIONAL_SOURCE_FILES} source/port/MemMang/heap_4.c)
elseif (Compile_Heap_Model STREQUAL "5")
	set(OPTIONAL_SOURCE_FILES ${OPTIONAL_SOURCE_FILES} source/port/MemMang/heap_5.c)
endif (Compile_Heap_Model STREQUAL "1")



add_library(${LIBNAME} ${MANDATORY_SOURCE_FILES} ${OPTIONAL_SOURCE_FILES})

include(CheckIPOSupported)
check_ipo_supported(RESULT result)
if(result)
	set_property(TARGET ${LIBNAME} PROPERTY INTERPROCEDURAL_OPTIMIZATION True)
endif()

add_definitions(-Wall -Wextra -Wmissing-prototypes -Wstrict-prototypes -c -std=gnu99)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
	set (CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -gdwarf-2")
endif (CMAKE_BUILD_TYPE STREQUAL "Debug")

install(TARGETS ${LIBNAME} DESTINATION lib)
install(FILES ${INSTALL_HEADERS} DESTINATION include/FreeRTOS)
install(FILES ${INSTALL_HEADERS_PRIV} DESTINATION include/FreeRTOS/private)
