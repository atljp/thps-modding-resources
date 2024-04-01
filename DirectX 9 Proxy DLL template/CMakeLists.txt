cmake_minimum_required(VERSION 3.10)

project(proxytemplate)

set(SRC "${CMAKE_SOURCE_DIR}/src")

set(SOURCE_FILES
	"${SRC}/main.c"
	"${SRC}/exports.def"
	"${SRC}/patch.c"
	"${SRC}/config.c"
)

set(HEADER_FILES
	"${SRC}/d3d9.h"
	"${SRC}/patch.h"
	"${SRC}/config.h"
)

#find_package(SDL2 REQUIRED)
#list(APPEND LIBS
#	SDL2::SDL2
#	SDL2::SDL2main
#)
#list(APPEND INCLUDES ${SDL2_INCLUDE_DIRS})

add_library(projectname SHARED)

target_sources(projectname PRIVATE
	${SOURCE_FILES}
	${HEADER_FILES}
)

target_link_libraries(projectname PUBLIC ${LIBS})

target_include_directories(projectname PUBLIC
	"${PROJECT_SOURCE_DIR}/src"
	${INCLUDES}
)

set_source_files_properties(exports.def PROPERTIES HEADER_FILE_ONLY TRUE)

set_target_properties(
    projectname 
    PROPERTIES 
        OUTPUT_NAME "d3d9"
)