# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/project/socket

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/project/socket/build

# Include any dependencies generated for this target.
include CMakeFiles/socket.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/socket.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/socket.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/socket.dir/flags.make

CMakeFiles/socket.dir/tcp_server.c.o: CMakeFiles/socket.dir/flags.make
CMakeFiles/socket.dir/tcp_server.c.o: ../tcp_server.c
CMakeFiles/socket.dir/tcp_server.c.o: CMakeFiles/socket.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/project/socket/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/socket.dir/tcp_server.c.o"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/socket.dir/tcp_server.c.o -MF CMakeFiles/socket.dir/tcp_server.c.o.d -o CMakeFiles/socket.dir/tcp_server.c.o -c /home/ubuntu/project/socket/tcp_server.c

CMakeFiles/socket.dir/tcp_server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/socket.dir/tcp_server.c.i"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/project/socket/tcp_server.c > CMakeFiles/socket.dir/tcp_server.c.i

CMakeFiles/socket.dir/tcp_server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/socket.dir/tcp_server.c.s"
	/usr/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/project/socket/tcp_server.c -o CMakeFiles/socket.dir/tcp_server.c.s

# Object files for target socket
socket_OBJECTS = \
"CMakeFiles/socket.dir/tcp_server.c.o"

# External object files for target socket
socket_EXTERNAL_OBJECTS =

socket: CMakeFiles/socket.dir/tcp_server.c.o
socket: CMakeFiles/socket.dir/build.make
socket: CMakeFiles/socket.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/project/socket/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable socket"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/socket.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/socket.dir/build: socket
.PHONY : CMakeFiles/socket.dir/build

CMakeFiles/socket.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/socket.dir/cmake_clean.cmake
.PHONY : CMakeFiles/socket.dir/clean

CMakeFiles/socket.dir/depend:
	cd /home/ubuntu/project/socket/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/project/socket /home/ubuntu/project/socket /home/ubuntu/project/socket/build /home/ubuntu/project/socket/build /home/ubuntu/project/socket/build/CMakeFiles/socket.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/socket.dir/depend

