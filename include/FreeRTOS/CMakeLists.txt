file(RELATIVE_PATH
    relPath # Output variable
    ${myGlobalSourceDir} # Base directory
    ${CMAKE_CURRENT_SOURCE_DIR} # Absolute path to the file
)

list(APPEND myHeaderFiles "${relPath}/common.h")
list(APPEND myHeaderFiles "${relPath}/RTOSConfig.h")
list(APPEND myHeaderFiles "${relPath}/task.h")

if (Compile_Queue)
	list(APPEND myHeaderFiles "${relPath}/queue.h")
	list(APPEND myHeaderFiles "${relPath}/semphr.h")
endif (Compile_Queue)

if (Compile_Timers)
	list(APPEND myHeaderFiles "${relPath}/timers.h")
endif (Compile_Timers)

if (Compile_EventGroups)
	list(APPEND myHeaderFiles "${relPath}/event_groups.h")
endif (Compile_EventGroups)

# message_buffer.h
# stream_buffer.h

set(myHeaderFiles "${myHeaderFiles}" PARENT_SCOPE)
