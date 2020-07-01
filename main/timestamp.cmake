cmake_minimum_required(VERSION 3.5)

string(TIMESTAMP ts "%s" UTC)
file(WRITE ${TIMESTAMP_FILE_PATH} "#define BUILD_TIMESTAMP ${ts}")
