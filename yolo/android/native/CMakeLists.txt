cmake_minimum_required(VERSION 3.10)
project(yolo)
add_library(yolo
    SHARED
    yolo.cpp
)

set(ncnn_DIR ${CMAKE_SOURCE_DIR}/ncnn-20230223-android-vulkan/${ANDROID_ABI}/lib/cmake/ncnn)
find_package(ncnn REQUIRED)
target_link_libraries(yolo ncnn)