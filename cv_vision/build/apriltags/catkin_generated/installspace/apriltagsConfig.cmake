# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(apriltags_CONFIG_INCLUDED)
  return()
endif()
set(apriltags_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("FALSE" STREQUAL "TRUE")
  set(apriltags_SOURCE_PREFIX /home/odroid/cv_vision/src/apriltags)
  set(apriltags_DEVEL_PREFIX /home/odroid/cv_vision/devel)
  set(apriltags_INSTALL_PREFIX "")
  set(apriltags_PREFIX ${apriltags_DEVEL_PREFIX})
else()
  set(apriltags_SOURCE_PREFIX "")
  set(apriltags_DEVEL_PREFIX "")
  set(apriltags_INSTALL_PREFIX /home/odroid/cv_vision/install)
  set(apriltags_PREFIX ${apriltags_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'apriltags' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(apriltags_FOUND_CATKIN_PROJECT TRUE)

if(NOT "include;/usr/include/eigen3;/opt/ros/kinetic/include/opencv-3.2.0-dev;/opt/ros/kinetic/include/opencv-3.2.0-dev/opencv " STREQUAL " ")
  set(apriltags_INCLUDE_DIRS "")
  set(_include_dirs "include;/usr/include/eigen3;/opt/ros/kinetic/include/opencv-3.2.0-dev;/opt/ros/kinetic/include/opencv-3.2.0-dev/opencv")
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${apriltags_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'apriltags' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  Ask the maintainer 'Mitchell Wills <mwills@wpi.edu>' to fix it.")
      endif()
    else()
      message(FATAL_ERROR "Project 'apriltags' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/odroid/cv_vision/install/${idir}'.  Ask the maintainer 'Mitchell Wills <mwills@wpi.edu>' to fix it.")
    endif()
    _list_append_unique(apriltags_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "apriltags;/opt/ros/kinetic/lib/libopencv_calib3d3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_core3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_features2d3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_flann3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_highgui3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_imgcodecs3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_imgproc3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_ml3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_objdetect3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_photo3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_shape3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_stitching3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_superres3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_video3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_videoio3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_videostab3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_viz3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_aruco3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_bgsegm3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_bioinspired3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_ccalib3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_cvv3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_datasets3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_dpm3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_face3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_fuzzy3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_hdf3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_line_descriptor3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_optflow3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_phase_unwrapping3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_plot3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_reg3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_rgbd3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_saliency3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_stereo3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_structured_light3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_surface_matching3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_text3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_xfeatures2d3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_ximgproc3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_xobjdetect3.so.3.2.0;/opt/ros/kinetic/lib/libopencv_xphoto3.so.3.2.0")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND apriltags_LIBRARIES ${library})
  elseif(TARGET ${library})
    list(APPEND apriltags_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND apriltags_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/odroid/cv_vision/install/lib;/home/odroid/cv_vision/devel/lib;/opt/ros/kinetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(apriltags_LIBRARY_DIRS ${lib_path})
      list(APPEND apriltags_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'apriltags'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND apriltags_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(apriltags_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${apriltags_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 apriltags_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${apriltags_dep}_FOUND)
      find_package(${apriltags_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${apriltags_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(apriltags_INCLUDE_DIRS ${${apriltags_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(apriltags_LIBRARIES ${apriltags_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${apriltags_dep}_LIBRARIES})
  _list_append_deduplicate(apriltags_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(apriltags_LIBRARIES ${apriltags_LIBRARIES})

  _list_append_unique(apriltags_LIBRARY_DIRS ${${apriltags_dep}_LIBRARY_DIRS})
  list(APPEND apriltags_EXPORTED_TARGETS ${${apriltags_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${apriltags_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
