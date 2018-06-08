# set uc specific sources and includes
if(CMAKE_SYSTEM_PROCESSOR STREQUAL "ATmega323")
	include_directories(source/port/GCC/ATMega323)
	set(INSTALL_HEADERS ${INSTALL_HEADERS} source/port/GCC/ATMega323/portmacro.h)
	set(OPTIONAL_SOURCE_FILES ${OPTIONAL_SOURCE_FILES} source/port/GCC/ATMega323/port.c)
endif(CMAKE_SYSTEM_PROCESSOR STREQUAL "ATmega323")
