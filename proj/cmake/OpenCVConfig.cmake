if(NOT TARGET OpenCV)
    # Define ${OpenCV_PROJECT_ROOT}. ${CMAKE_CURRENT_LIST_DIR} is just the current directory.
    get_filename_component(OpenCV_PROJECT_ROOT "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)

    # Define ${CINDER_PATH} as usual.
    get_filename_component(CINDER_PATH "${Cinder-Notifications_PROJECT_ROOT}/../.." ABSOLUTE)

    # Make a list of source files and define that to be ${SOURCE_LIST}.
    file(GLOB SOURCE_LIST CONFIGURE_DEPENDS
            )

    # Create the library!
    add_library(OpenCV ${SOURCE_LIST})

    # Add include directories.
    # Notice that `cinderblock.xml` has `<includePath>src</includePath>`.
    # So you need to set `../../src/` to include.
    target_include_directories(OpenCV PUBLIC "${OpenCV_PROJECT_ROOT}/src" )
    target_include_directories(OpenCV SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )


    # If your Cinder block has no source code but instead pre-build libraries,
    # you can specify all of them here (uncomment the below line and adjust to your needs).
    # Make sure to use the libraries for the right platform.
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_calib3d.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_contrib.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_core.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_features2d.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_flann.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_gpu.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_imgproc.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_legacy.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_ml.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_nonfree.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_objdetect.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_ocl.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_photo.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_stitching.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_superres.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_ts.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_video.a)
    target_link_libraries(OpenCV ${Cinder-OpenCV_PROJECT_ROOT}/lib/macosx/libopencv_videostab.a)

    if(NOT TARGET cinder)
        include("${CINDER_PATH}/proj/cmake/configure.cmake")
        find_package(cinder REQUIRED PATHS
                "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
                "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}")
    endif()
    target_link_libraries(Cinder-Notifications PRIVATE cinder)

endif()