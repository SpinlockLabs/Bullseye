file(GLOB VM_SRC "${CMAKE_CURRENT_LIST_DIR}/*.cc")

add_executable(bullseye_vm ${VM_SRC})
add_dependencies(bullseye_vm bullseye_platform)

