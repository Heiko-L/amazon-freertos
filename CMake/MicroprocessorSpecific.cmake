# set uc specific sources and includes
if(CMAKE_SYSTEM_PROCESSOR STREQUAL "atmega88")
	add_subdirectory (port/atmega88)
endif(CMAKE_SYSTEM_PROCESSOR STREQUAL "atmega88")

if(CMAKE_SYSTEM_PROCESSOR STREQUAL "atmega168")
	add_subdirectory (port/atmega88)
endif(CMAKE_SYSTEM_PROCESSOR STREQUAL "atmega168")
