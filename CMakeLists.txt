cmake_minimum_required(VERSION 3.0.0)

project(socket)

add_executable(${PROJECT_NAME}
    ./tcp_server.c
)