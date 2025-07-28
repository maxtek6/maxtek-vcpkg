add_library(maxtek::sigfn STATIC IMPORTED)

if(WIN32)
    set(SIGFN_LIB "${_IMPORT_PREFIX}/lib/sigfn.lib")
else()
    set(SIGFN_LIB "${_IMPORT_PREFIX}/lib/sigfn.a")
endif()

# Use appropriate extension depending on platform (.lib or .a)
set_target_properties(maxtek::sigfn PROPERTIES
    IMPORTED_LOCATION "${SIGFN_LIB}"
    INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)