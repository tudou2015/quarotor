# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "uart: 1 messages, 2 services")

set(MSG_I_FLAGS "-Iuart:/home/odroid/cv_vision/src/uart/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(uart_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/odroid/cv_vision/src/uart/msg/mpu6050.msg" NAME_WE)
add_custom_target(_uart_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "uart" "/home/odroid/cv_vision/src/uart/msg/mpu6050.msg" ""
)

get_filename_component(_filename "/home/odroid/cv_vision/src/uart/srv/uart_srv2.srv" NAME_WE)
add_custom_target(_uart_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "uart" "/home/odroid/cv_vision/src/uart/srv/uart_srv2.srv" ""
)

get_filename_component(_filename "/home/odroid/cv_vision/src/uart/srv/uart_srv.srv" NAME_WE)
add_custom_target(_uart_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "uart" "/home/odroid/cv_vision/src/uart/srv/uart_srv.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(uart
  "/home/odroid/cv_vision/src/uart/msg/mpu6050.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uart
)

### Generating Services
_generate_srv_cpp(uart
  "/home/odroid/cv_vision/src/uart/srv/uart_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uart
)
_generate_srv_cpp(uart
  "/home/odroid/cv_vision/src/uart/srv/uart_srv2.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uart
)

### Generating Module File
_generate_module_cpp(uart
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uart
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(uart_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(uart_generate_messages uart_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/msg/mpu6050.msg" NAME_WE)
add_dependencies(uart_generate_messages_cpp _uart_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/srv/uart_srv2.srv" NAME_WE)
add_dependencies(uart_generate_messages_cpp _uart_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/srv/uart_srv.srv" NAME_WE)
add_dependencies(uart_generate_messages_cpp _uart_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(uart_gencpp)
add_dependencies(uart_gencpp uart_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS uart_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(uart
  "/home/odroid/cv_vision/src/uart/msg/mpu6050.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uart
)

### Generating Services
_generate_srv_eus(uart
  "/home/odroid/cv_vision/src/uart/srv/uart_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uart
)
_generate_srv_eus(uart
  "/home/odroid/cv_vision/src/uart/srv/uart_srv2.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uart
)

### Generating Module File
_generate_module_eus(uart
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uart
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(uart_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(uart_generate_messages uart_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/msg/mpu6050.msg" NAME_WE)
add_dependencies(uart_generate_messages_eus _uart_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/srv/uart_srv2.srv" NAME_WE)
add_dependencies(uart_generate_messages_eus _uart_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/srv/uart_srv.srv" NAME_WE)
add_dependencies(uart_generate_messages_eus _uart_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(uart_geneus)
add_dependencies(uart_geneus uart_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS uart_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(uart
  "/home/odroid/cv_vision/src/uart/msg/mpu6050.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uart
)

### Generating Services
_generate_srv_lisp(uart
  "/home/odroid/cv_vision/src/uart/srv/uart_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uart
)
_generate_srv_lisp(uart
  "/home/odroid/cv_vision/src/uart/srv/uart_srv2.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uart
)

### Generating Module File
_generate_module_lisp(uart
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uart
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(uart_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(uart_generate_messages uart_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/msg/mpu6050.msg" NAME_WE)
add_dependencies(uart_generate_messages_lisp _uart_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/srv/uart_srv2.srv" NAME_WE)
add_dependencies(uart_generate_messages_lisp _uart_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/srv/uart_srv.srv" NAME_WE)
add_dependencies(uart_generate_messages_lisp _uart_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(uart_genlisp)
add_dependencies(uart_genlisp uart_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS uart_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(uart
  "/home/odroid/cv_vision/src/uart/msg/mpu6050.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uart
)

### Generating Services
_generate_srv_nodejs(uart
  "/home/odroid/cv_vision/src/uart/srv/uart_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uart
)
_generate_srv_nodejs(uart
  "/home/odroid/cv_vision/src/uart/srv/uart_srv2.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uart
)

### Generating Module File
_generate_module_nodejs(uart
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uart
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(uart_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(uart_generate_messages uart_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/msg/mpu6050.msg" NAME_WE)
add_dependencies(uart_generate_messages_nodejs _uart_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/srv/uart_srv2.srv" NAME_WE)
add_dependencies(uart_generate_messages_nodejs _uart_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/srv/uart_srv.srv" NAME_WE)
add_dependencies(uart_generate_messages_nodejs _uart_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(uart_gennodejs)
add_dependencies(uart_gennodejs uart_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS uart_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(uart
  "/home/odroid/cv_vision/src/uart/msg/mpu6050.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uart
)

### Generating Services
_generate_srv_py(uart
  "/home/odroid/cv_vision/src/uart/srv/uart_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uart
)
_generate_srv_py(uart
  "/home/odroid/cv_vision/src/uart/srv/uart_srv2.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uart
)

### Generating Module File
_generate_module_py(uart
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uart
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(uart_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(uart_generate_messages uart_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/msg/mpu6050.msg" NAME_WE)
add_dependencies(uart_generate_messages_py _uart_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/srv/uart_srv2.srv" NAME_WE)
add_dependencies(uart_generate_messages_py _uart_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/odroid/cv_vision/src/uart/srv/uart_srv.srv" NAME_WE)
add_dependencies(uart_generate_messages_py _uart_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(uart_genpy)
add_dependencies(uart_genpy uart_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS uart_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uart)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/uart
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(uart_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uart)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/uart
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(uart_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uart)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/uart
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(uart_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uart)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/uart
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(uart_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uart)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uart\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/uart
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(uart_generate_messages_py std_msgs_generate_messages_py)
endif()
