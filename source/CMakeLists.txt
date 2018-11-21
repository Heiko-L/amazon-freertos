add_subdirectory (controller_specific)
add_subdirectory (heap_implementation)

file(RELATIVE_PATH
    relPath # Output variable
    ${myGlobalSourceDir} # Base directory
    ${CMAKE_CURRENT_SOURCE_DIR} # Absolute path to the file
)

#
# mandatory files
#

list(APPEND mySourceFiles "${relPath}/tasks.c")
list(APPEND mySourceFiles "${relPath}/list.c")

if (Compile_Queue)
	list(APPEND mySourceFiles "${relPath}/queue.c")
endif (Compile_Queue)

if (Compile_Timers)
	list(APPEND mySourceFiles "${relPath}/timers.c")
endif (Compile_Timers)

if (Compile_EventGroups)
	list(APPEND mySourceFiles "${relPath}/event_groups.c")
endif (Compile_EventGroups)

set(mySourceFiles "${mySourceFiles}" PARENT_SCOPE)
set(myAdditionalIncludes "${myAdditionalIncludes}" PARENT_SCOPE)
