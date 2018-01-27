# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "apdriver: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iapdriver:/home/odroid/cv_vision/src/apdriver/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(apdriver_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/odroid/cv_vision/src/apdriver/msg/control.msg" NAME_WE)
add_custom_target(_apdriver_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "apdriver" "/home/odroid/cv_vision/src/apdriver/msg/control.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(apdriver
  "/home/odroid/cv_vision/src/apdriver/msg/control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apdriver
)

### Generating Services

### Generating Module File
_generate_module_cpp(apdriver
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apdriver
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(apdriver_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(apdriver_generate_messages apdriver_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/cv_vision/src/apdriver/msg/control.msg" NAME_WE)
add_dependencies(apdriver_generate_messages_cpp _apdriver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apdriver_gencpp)
add_dependencies(apdriver_gencpp apdriver_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apdriver_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(apdriver
  "/home/odroid/cv_vision/src/apdriver/msg/control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apdriver
)

### Generating Services

### Generating Module File
_generate_module_eus(apdriver
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apdriver
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(apdriver_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(apdriver_generate_messages apdriver_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/cv_vision/src/apdriver/msg/control.msg" NAME_WE)
add_dependencies(apdriver_generate_messages_eus _apdriver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apdriver_geneus)
add_dependencies(apdriver_geneus apdriver_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apdriver_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(apdriver
  "/home/odroid/cv_vision/src/apdriver/msg/control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apdriver
)

### Generating Services

### Generating Module File
_generate_module_lisp(apdriver
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apdriver
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(apdriver_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(apdriver_generate_messages apdriver_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/cv_vision/src/apdriver/msg/control.msg" NAME_WE)
add_dependencies(apdriver_generate_messages_lisp _apdriver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apdriver_genlisp)
add_dependencies(apdriver_genlisp apdriver_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apdriver_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(apdriver
  "/home/odroid/cv_vision/src/apdriver/msg/control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/apdriver
)

### Generating Services

### Generating Module File
_generate_module_nodejs(apdriver
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/apdriver
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(apdriver_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(apdriver_generate_messages apdriver_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/cv_vision/src/apdriver/msg/control.msg" NAME_WE)
add_dependencies(apdriver_generate_messages_nodejs _apdriver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apdriver_gennodejs)
add_dependencies(apdriver_gennodejs apdriver_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apdriver_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(apdriver
  "/home/odroid/cv_vision/src/apdriver/msg/control.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apdriver
)

### Generating Services

### Generating Module File
_generate_module_py(apdriver
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apdriver
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(apdriver_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(apdriver_generate_messages apdriver_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/odroid/cv_vision/src/apdriver/msg/control.msg" NAME_WE)
add_dependencies(apdriver_generate_messages_py _apdriver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apdriver_genpy)
add_dependencies(apdriver_genpy apdriver_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apdriver_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apdriver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apdriver
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(apdriver_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apdriver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apdriver
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(apdriver_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apdriver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apdriver
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(apdriver_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/apdriver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/apdriver
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(apdriver_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apdriver)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apdriver\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apdriver
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(apdriver_generate_messages_py std_msgs_generate_messages_py)
endif()
