file(RELATIVE_PATH
    relPath # Output variable
    ${myGlobalSourceDir} # Base directory
    ${CMAKE_CURRENT_SOURCE_DIR} # Absolute path to the file
)

if (Compile_Heap_Model STREQUAL "1")
	list(APPEND mySourceFiles ${relPath}/heap_1.c)
	elseif (Compile_Heap_Model STREQUAL "2")
		list(APPEND mySourceFiles ${relPath}/heap_2.c)
		elseif (Compile_Heap_Model STREQUAL "3")
			list(APPEND mySourceFiles ${relPath}/heap_3.c)
			elseif (Compile_Heap_Model STREQUAL "4")
				list(APPEND mySourceFiles ${relPath}/heap_4.c)
				elseif (Compile_Heap_Model STREQUAL "5")
					list(APPEND mySourceFiles ${relPath}/heap_5.c)
endif (Compile_Heap_Model STREQUAL "1")

set(mySourceFiles "${mySourceFiles}" PARENT_SCOPE)
