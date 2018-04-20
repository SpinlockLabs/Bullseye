file(GLOB PLATFORM_SRC "${CMAKE_CURRENT_LIST_DIR}/*.cc")

add_library(bullseye_platform ${PLATFORM_SRC})

