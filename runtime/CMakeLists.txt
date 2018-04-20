add_definitions(-DNDEBUG -DHOST_OS_MACOS -DTARGET_ARCH_X64)
include_directories(${CMAKE_CURRENT_LIST_DIR})

include("${CMAKE_CURRENT_LIST_DIR}/platform/CMakeLists.txt")
include("${CMAKE_CURRENT_LIST_DIR}/vm/CMakeLists.txt")
