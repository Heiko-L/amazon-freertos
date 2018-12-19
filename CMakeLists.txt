cmake_minimum_required (VERSION 3.9)
project (FreeRTOS C)

set(myGlobalSourceDir ${CMAKE_CURRENT_SOURCE_DIR})

set(CMAKE_DEBUG_POSTFIX "-dbg")

# define CMAKE_INSTALL_PREFIX and CMAKE_PREFIX_PATH in crossconfig.cmake
include(crossconfig.cmake OPTIONAL)

# set standard build type
if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE MinSizeRel CACHE STRING
		"Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
		FORCE)
endif(NOT CMAKE_BUILD_TYPE)

include(CMake/MicroprocessorSpecific.cmake)
include(CMake/FreeRTOSConfig.cmake)
include(CMake/FreeRTOSConfigDependencies.cmake)

configure_file("CMake/FreeRTOSConfig.h.in" "include/FreeRTOS/FreeRTOSConfig.h" @ONLY)

list(APPEND myHeaderFiles "${CMAKE_CURRENT_BINARY_DIR}/include/FreeRTOS/FreeRTOSConfig.h")

option(Compile_Queue "Compile queue.c" ON)
option(Compile_Timers "Compile timers.c" ON)
option(Compile_EventGroups "Compile event_groups.c" ON)
set (Compile_Heap_Model "1" CACHE STRING "Compile heapx.c, set to 0 for your own memory allocation")

add_subdirectory (include)
add_subdirectory (source)

message(STATUS "myHeaderFiles:" "${myHeaderFiles}")
message(STATUS "myIncludeDirs:" "${myIncludeDirs}")
message(STATUS "mySourceFiles:" "${mySourceFiles}")

include_directories(include)
include_directories("${CMAKE_CURRENT_BINARY_DIR}/include")
include_directories("${myIncludeDirs}")

add_library(${CMAKE_PROJECT_NAME} ${mySourceFiles})

include(CheckIPOSupported)
check_ipo_supported(RESULT result)
if(result)
	set_property(TARGET ${CMAKE_PROJECT_NAME} PROPERTY INTERPROCEDURAL_OPTIMIZATION True)
endif()

target_compile_options	(
						${CMAKE_PROJECT_NAME} 
						PUBLIC	-funsigned-char -funsigned-bitfields
								-ffunction-sections -fdata-sections
								-fpack-struct -fshort-enums -Wall
								-Wextra -Wmissing-prototypes -Wstrict-prototypes
								-c -std=gnu99
								-B ${MY_ADDITIONAL_GCC_DFP_PATH}
						)
target_link_libraries(${CMAKE_PROJECT_NAME} -Wl,--gc-sections "-B ${MY_ADDITIONAL_GCC_DFP_PATH}")

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
	set (CMAKE_C_FLAGS_DEBUG "-g3 -O0")
endif (CMAKE_BUILD_TYPE STREQUAL "Debug")

install(TARGETS ${CMAKE_PROJECT_NAME} DESTINATION lib)
install(FILES ${myHeaderFiles} DESTINATION include/FreeRTOS)
