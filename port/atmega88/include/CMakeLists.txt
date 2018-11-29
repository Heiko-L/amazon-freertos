add_subdirectory (FreeRTOS)

file(RELATIVE_PATH
    relPath # Output variable
    ${myGlobalSourceDir} # Base directory
    ${CMAKE_CURRENT_SOURCE_DIR} # Absolute path to the file
)

include_directories(${relPath})

# sending myHeaderFiles down the tree...
set(myHeaderFiles "${myHeaderFiles}" PARENT_SCOPE)
