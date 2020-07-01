idf_component_register(SRCS "main.c")

target_include_directories(${COMPONENT_LIB} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
set(TIMESTAMP_FILE_PATH ${CMAKE_CURRENT_BINARY_DIR}/timestamp.h)

add_custom_target(timestamp_file ALL
                  COMMAND ${CMAKE_COMMAND}
                  -D"TIMESTAMP_FILE_PATH=${TIMESTAMP_FILE_PATH}"
                  -P ${CMAKE_CURRENT_LIST_DIR}/timestamp.cmake
                  BYPRODUCTS ${TIMESTAMP_FILE_PATH})


set_source_files_properties(${TIMESTAMP_FILE_PATH}
    PROPERTIES GENERATED TRUE
    HEADER_FILE_ONLY TRUE)

add_dependencies(${COMPONENT_LIB} timestamp_file)
