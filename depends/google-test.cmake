if(NOT TARGET depends::google-test)
  FetchContent_Declare(
      depends-google-test
      GIT_REPOSITORY https://github.com/google/googletest.git
      GIT_TAG        703bd9caab50b139428cea1aaff9974ebee5742e # release-1.10.0
  )
  FetchContent_GetProperties(depends-google-test)
  if(NOT depends-google-test_POPULATED)
      message(STATUS "Fetching google-test sources")
      FetchContent_Populate(depends-google-test)
      message(STATUS "Fetching google-test sources - done")
  endif()
  add_subdirectory(${depends-google-test_SOURCE_DIR} ${depends-google-test_BINARY_DIR})
  add_library(depends::google-test INTERFACE IMPORTED GLOBAL)
  target_compile_options(gtest PRIVATE -Wno-maybe-uninitialized)
  target_link_libraries(depends::google-test INTERFACE gtest)
  set(depends-google-test-source-dir ${depends-google-test_SOURCE_DIR} CACHE INTERNAL "" FORCE)
  set(depends-google-test-binary-dir ${depends-google-test_BINARY_DIR} CACHE INTERNAL "" FORCE)
  mark_as_advanced(depends-google-test-source-dir)
  mark_as_advanced(depends-google-test-binary-dir)
endif()