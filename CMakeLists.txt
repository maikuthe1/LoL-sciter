cmake_minimum_required(VERSION 3.0)

project(LoL-sciter)

if(UNIX AND NOT APPLE)
  find_package(PkgConfig REQUIRED)
  pkg_check_modules(GTK3 REQUIRED gtk+-3.0)
  include_directories(${GTK3_INCLUDE_DIRS})
  link_directories(${GTK3_LIBRARY_DIRS})
  add_definitions(${GTK3_CFLAGS_OTHER})
  set(LIBRARIES ${LIBRARIES} ${GTK3_LIBRARIES})
endif()

include_directories(extlibs/sciter-js-sdk/include)

file(GLOB SOURCES src/*.cpp)

# add_subdirectory(extlibs/elzip)

add_executable(LoL-sciter ${SOURCES})

if(WIN32)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static-libgcc -static-libstdc++ -static -mwindows -municode")
  target_sources(LoL-sciter PRIVATE ver.rc)
endif()


# Compile resources into reosurces.cpp with sciter packer
if(UNIX AND NOT APPLE)
# // Add this as a custom build command in your IDE
#add_custom_command(
#  TARGET LoL-sciter
#  PRE_BUILD
#  COMMAND ./packfolder
#  ARGS ${CMAKE_SOURCE_DIR}/resources/ ${CMAKE_SOURCE_DIR}/src/resources.cpp -v "resources"
#  WORKING_DIRECTORY
#  ${CMAKE_SOURCE_DIR}/extlibs/sciter-js-sdk/bin/linux/
#)
endif()
if(WIN32)
add_custom_command(
  TARGET LoL-sciter
  PRE_BUILD
  COMMAND packfolder.exe
  ARGS ${CMAKE_SOURCE_DIR}/resources/ ${CMAKE_SOURCE_DIR}/src/resources.cpp -v "resources"
  WORKING_DIRECTORY
  ${CMAKE_SOURCE_DIR}/extlibs/sciter-js-sdk/bin/windows/
)
endif()

target_link_libraries(LoL-sciter ${LIBRARIES})


#install(TARGETS LoL-sciter RUNTIME DESTINATION bin)
