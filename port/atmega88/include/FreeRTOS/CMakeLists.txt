file(RELATIVE_PATH
    relPath # Output variable
    ${myGlobalSourceDir} # Base directory
    ${CMAKE_CURRENT_SOURCE_DIR} # Absolute path to the file
)

list(APPEND myHeaderFiles "${relPath}/context_macros.h")
list(APPEND myHeaderFiles "${relPath}/isr.h")
list(APPEND myHeaderFiles "${relPath}/port_specific.h")

set(myHeaderFiles "${myHeaderFiles}" PARENT_SCOPE)
