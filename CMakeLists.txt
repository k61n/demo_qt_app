cmake_minimum_required(VERSION 3.25)

project(gr-demo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 REQUIRED COMPONENTS Widgets)
find_package(GR REQUIRED)

set(PROJECT_SOURCES
    main.cpp
    mainwindow.cpp
    mainwindow.h
    mainwindow.ui
    grplot.h
    grplot.cpp
)

add_executable(gr-demo ${PROJECT_SOURCES})
target_link_libraries(gr-demo PRIVATE Qt5::Widgets GR::qt5gr)

if(APPLE)
    set_target_properties(gr-demo PROPERTIES
        MACOSX_BUNDLE_GUI_IDENTIFIER com.example.gr-demo
        MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
        MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
        MACOSX_BUNDLE TRUE
        WIN32_EXECUTABLE TRUE)
endif()
