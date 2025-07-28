vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO maxtek6/sigfn
    REF v1.0.0
    SHA512 86aada1a3c63e2323918d081c4f2f219c3c071a135ee9fc5c99aa2c5888e678a2de4e9d90f6340c74174347610fdb7a43ff558beff7181514d880d3ae3f94a46
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_build()

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")