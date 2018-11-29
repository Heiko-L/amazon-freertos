file(RELATIVE_PATH
    relPath # Output variable
    ${myGlobalSourceDir} # Base directory
    ${CMAKE_CURRENT_SOURCE_DIR} # Absolute path to the file
)

list(APPEND mySourceFiles ${relPath}/port.c)

set(mySourceFiles "${mySourceFiles}" PARENT_SCOPE)
