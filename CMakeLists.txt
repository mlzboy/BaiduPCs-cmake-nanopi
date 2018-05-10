PROJECT(BaiduPCs)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

INCLUDE_DIRECTORIES(./src)

INCLUDE_DIRECTORIES("/usr/include/curl")
#INCLUDE_DIRECTORIES(./src/gen-cpp)
AUX_SOURCE_DIRECTORY(./src/rb_tree DIR_SRCS)
AUX_SOURCE_DIRECTORY(./src/pcs DIR_SRCS)
AUX_SOURCE_DIRECTORY(./src DIR_SRCS)
#AUX_SOURCE_DIRECTORY(./src/gen-cpp/QueryRewrite DIR_SRCS)
#AUX_SOURCE_DIRECTORY(./src/gen-cpp/QueryAnalysis DIR_SRCS)
#AUX_SOURCE_DIRECTORY(./src/parsers/car_rental DIR_SRCS)
#AUX_SOURCE_DIRECTORY(./src/parsers/knowledge DIR_SRCS)
#AUX_SOURCE_DIRECTORY(./src/parsers/lottery DIR_SRCS)
#AUX_SOURCE_DIRECTORY(./src/parsers/gift DIR_SRCS)
list(REMOVE_ITEM DIR_SRCS "./src/pcs/dllmain.c")
list(REMOVE_ITEM DIR_SRCS "./src/rb_tree/test_red_black_tree.c")
SET(CMAKE_CXX_FLAGS_DEBUG   "$ENV{CXXFLAGS} -g -O0 -Wall -Wno-unused-parameter -Wunused-function -Wunused-variable -Wunused-value -W -D_FILE_OFFSET_BITS=64 -D_LARGE_FILE")
SET(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS}    -O3 -Wall -Wno-unused-parameter -Wunused-function -Wunused-variable -Wunused-value -W -D_FILE_OFFSET_BITS=64 -D_LARGE_FILE")

IF (CMAKE_BUILD_TYPE STREQUAL "Debug")
    MESSAGE(STATUS "Debug Mode")
    MESSAGE(STATUS "Flags:" ${CMAKE_CXX_FLAGS_DEBUG} )
ELSE (CMAKE_BUILD_TYPE STREQUAL "Release")
    MESSAGE(STATUS "Release Mode")
    MESSAGE(STATUS "Flags:" ${CMAKE_CXX_FLAGS_RELEASE})
ENDIF (CMAKE_BUILD_TYPE STREQUAL "Debug")

SET(LIBRARIES 
/usr/lib/x86_64-linux-gnu/libcurl.so
/usr/lib/x86_64-linux-gnu/libssl.so
/usr/lib/x86_64-linux-gnu/libcrypto.so
/usr/lib/x86_64-linux-gnu/libpthread.so
/usr/lib/x86_64-linux-gnu/libm.so
#/home/maolingzhi/opt/lib/libthrift.a
#/usr/local/lib/libthrift.a
#/usr/local/lib/json/libjson_linux-gcc-4.1.2_libmt.a
)

#LINK_DIRECTORIES(/usr/lib/boost)

add_definitions(-DHAVE_NETINET_IN_H)
add_definitions(-DDEBUG)
ADD_EXECUTABLE(BaiduPCs ${DIR_SRCS})

TARGET_LINK_LIBRARIES(BaiduPCs ${LIBRARIES})
#TARGET_LINK_LIBRARIES(QueryParser boost_filesystem)
#TARGET_LINK_LIBRARIES(QueryParser boost_thread)
#TARGET_LINK_LIBRARIES(QueryParser boost_system)
#TARGET_LINK_LIBRARIES(QueryParser boost_regex)
#TARGET_LINK_LIBRARIES(QueryParser boost_program_options)

#临时调试用, 便于在eclipse中直接执行程序
SET(EXECUTABLE_OUTPUT_PATH ../Debug)

