add_subdirectory (FreeRTOS)

file(RELATIVE_PATH
    relPath # Output variable
    ${myGlobalSourceDir} # Base directory
    ${CMAKE_CURRENT_SOURCE_DIR} # Absolute path to the file
)

list(APPEND myIncludeDirs "${relPath}")

# sending myHeaderFiles down the tree...
set(myHeaderFiles "${myHeaderFiles}" PARENT_SCOPE)
set(myIncludeDirs "${myIncludeDirs}" PARENT_SCOPE)
