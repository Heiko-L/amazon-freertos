# set uc specific sources and includes
if(CMAKE_SYSTEM_PROCESSOR STREQUAL "ATmega323")
	include_directories(port/ATMega323/include)
	set(INSTALL_HEADERS ${INSTALL_HEADERS} port/ATMega323/include/FreeRTOS/portmacro.h)
	set(OPTIONAL_SOURCE_FILES ${OPTIONAL_SOURCE_FILES} port/ATMega323/source/port.c)
endif(CMAKE_SYSTEM_PROCESSOR STREQUAL "ATmega323")

if(CMAKE_SYSTEM_PROCESSOR STREQUAL "atmega88")
	include_directories(port/atmega88/include)
	set(INSTALL_HEADERS ${INSTALL_HEADERS} port/atmega88/include/FreeRTOS/portmacro.h)
	set(OPTIONAL_SOURCE_FILES ${OPTIONAL_SOURCE_FILES} port/atmega88/source/port.c)
endif(CMAKE_SYSTEM_PROCESSOR STREQUAL "atmega88")
