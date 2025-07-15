cmake_minimum_required(VERSION 3.16)

project(flow_tech_project VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appflow_tech_project
    main.cpp  # Ensure main.cpp is listed here
)

# Ensure QML_FILES are correctly referenced
qt_add_qml_module(appflow_tech_project
    URI flow_tech_project
    VERSION 1.0
    QML_FILES
        Main.qml
        LoadingScreen.qml
        MainScreen.qml
    SOURCES
        Include.h
        water_eq.hpp
        water_eq.cpp

    RESOURCES
        images/flowtech_logo.png
        QML_FILES Loginpage.qml
        QML_FILES Dashboard.qml
        QML_FILES GasScreen.qml
        SOURCES WE_Gas.hpp
        SOURCES WE_Gas.cpp
        QML_FILES ForgotPasswordPage.qml
)

set_target_properties(appflow_tech_project PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appflow_tech_project
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appflow_tech_project
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
