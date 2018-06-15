cmake_minimum_required (VERSION 3.9)
project (FreeRTOS C)
set(globalLibName "FreeRTOS")

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

#
# mandatory files
#
list(APPEND mandatorySourceFiles "source/tasks.c")
list(APPEND mandatorySourceFiles "source/list.c")

list(APPEND installHeaderFiles "include/FreeRTOS.h")
list(APPEND installHeaderFiles "include/task.h")
list(APPEND installPrivateHeaderFiles "include/private/list.h")

configure_file("CMake/FreeRTOSConfig.h.in" "FreeRTOSConfig.h" @ONLY)
configure_file("CMake/FreeRTOS_uc.h.in" "FreeRTOS_uc.h" @ONLY)
configure_file("CMake/FreeRTOSExternProvided.h.in" "FreeRTOSExternProvided.h" @ONLY)

list(APPEND installHeaderFiles "${CMAKE_CURRENT_BINARY_DIR}/FreeRTOSConfig.h")
list(APPEND installHeaderFiles "${CMAKE_CURRENT_BINARY_DIR}/FreeRTOS_uc.h")
list(APPEND installHeaderFiles "${CMAKE_CURRENT_BINARY_DIR}/FreeRTOSExternProvided.h")

list(APPEND installPrivateHeaderFiles "include/private/deprecated_definitions.h")

list(APPEND installPrivateHeaderFiles include/private/mpu_wrappers.h)
list(APPEND installPrivateHeaderFiles include/private/portable.h)
list(APPEND installPrivateHeaderFiles include/private/projdefs.h)
list(APPEND installPrivateHeaderFiles include/private/stack_macros.h)

include_directories(${CMAKE_CURRENT_BINARY_DIR} include)

option(Compile_Queue "Compile queue.c" OFF)
option(Compile_Timers "Compile timers.c" OFF)
option(Compile_EventGroups "Compile event_groups.c" OFF)
set (Compile_Heap_Model "1" CACHE STRING "Compile heapx.c, set to 0 for your own memory allocation")

if (Compile_Queue)
	list(APPEND optionalSourceFiles "source/queue.c")
	list(APPEND installHeaderFiles "include/queue.h")
	list(APPEND installHeaderFiles "include/semphr.h")
endif (Compile_Queue)

if (Compile_Timers)
	list(APPEND optionalSourceFiles "source/timers.c")
	list(APPEND installHeaderFiles "include/timers.h")
endif (Compile_Timers)

if (Compile_EventGroups)
	list(APPEND optionalSourceFiles "source/event_groups.c")
	list(APPEND installHeaderFiles "include/event_groups.h")
endif (Compile_EventGroups)

if (Compile_Heap_Model STREQUAL "1")
	list(APPEND optionalSourceFiles "source/heap_implementation/heap_1.c")
	elseif (Compile_Heap_Model STREQUAL "2")
		list(APPEND optionalSourceFiles "source/heap_implementation/heap_2.c")
		elseif (Compile_Heap_Model STREQUAL "3")
			list(APPEND optionalSourceFiles "source/heap_implementation/heap_3.c")
			elseif (Compile_Heap_Model STREQUAL "4")
				list(APPEND optionalSourceFiles "source/heap_implementation/heap_4.c")
				elseif (Compile_Heap_Model STREQUAL "5")
					list(APPEND optionalSourceFiles "source/heap_implementation/heap_5.c")
endif (Compile_Heap_Model STREQUAL "1")

add_library(${globalLibName} ${mandatorySourceFiles} ${optionalSourceFiles})

include(CheckIPOSupported)
check_ipo_supported(RESULT result)
if(result)
	set_property(TARGET ${globalLibName} PROPERTY INTERPROCEDURAL_OPTIMIZATION True)
endif()

add_definitions(-Wall -Wextra -Wmissing-prototypes -Wstrict-prototypes -c -std=gnu99)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
	set (CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -gdwarf-2")
endif (CMAKE_BUILD_TYPE STREQUAL "Debug")

install(TARGETS ${globalLibName} DESTINATION lib)
install(FILES ${installHeaderFiles} DESTINATION include/FreeRTOS)
install(FILES ${installPrivateHeaderFiles} DESTINATION include/FreeRTOS/private)
