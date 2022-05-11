# Discovery of the dependencies of USDPluginExamples.

# Boost & python.
if (ENABLE_PYTHON_SUPPORT)
    # Find python libraries.
    if (USE_PYTHON_3)
        find_package(PythonInterp 3.0 REQUIRED)
        find_package(PythonLibs 3.0 REQUIRED)
    else()
        find_package(PythonInterp 2.7 REQUIRED)
        find_package(PythonLibs 2.7 REQUIRED)
    endif()

    # Pick up boost version variables.
    set(Boost_USE_STATIC_LIBS OFF)
    set(BUILD_SHARED_LIBS ON)
    find_package(Boost
        COMPONENTS
            python
        REQUIRED
        HINTS ${USD_ROOT}
    )

    set(boost_version_string "${Boost_MAJOR_VERSION}.${Boost_MINOR_VERSION}.${Boost_SUBMINOR_VERSION}")
endif()

# USD & TBB
include(${USD_ROOT}/pxrConfig.cmake)
find_package(TBB REQUIRED)
