vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO maxtek6/sigfn
    REF v1.0.0
    SHA512 c66057599f5521b7c4f426be1ff22594d88fb8ed2713e7552f32fdca099a75527f4a02dee800cbe0dfcdd292db210e7f18df8461276c95680b6bf6c2ea8d5ec5
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_build()

vcpkg_cmake_install()

file(INSTALL
    "${CMAKE_CURRENT_LIST_DIR}/sigfn-config.cmake"
    "${CMAKE_CURRENT_LIST_DIR}/sigfn-targets.cmake"
    DESTINATION "share/sigfn"
)

vcpkg_fixup_cmake_targets(CONFIG_PATH share/sigfn TARGET_PATH share/sigfn)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")