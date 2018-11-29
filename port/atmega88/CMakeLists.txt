add_subdirectory (include)
add_subdirectory (source)

# sending variables down the tree...
set(myHeaderFiles "${myHeaderFiles}" PARENT_SCOPE)
set(mySourceFiles "${mySourceFiles}" PARENT_SCOPE)
