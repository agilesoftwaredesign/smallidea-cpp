cmake_minimum_required(VERSION 3.5)
project(smallidea)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
add_compile_options(-Wall -Wpedantic -Werror)

find_package(Boost REQUIRED COMPONENTS system)
find_package(Threads REQUIRED)

add_subdirectory(3rdparty)

########

add_library(smallidea
        src/Foo.cpp include/smallidea/Foo.h)
target_include_directories(smallidea PUBLIC
        include)
target_compile_options(smallidea PRIVATE -Wall -Wpedantic -Werror -Wextra)

########

add_executable(smallidea_spec
        spec/FooSpec.cpp)
target_link_libraries(smallidea_spec PRIVATE
        smallidea
        gtest gmock gtest_main)

########

add_executable(fitnesse_fixture
        acceptance-spec/fitnesse-fixture/FooFitnesseFixture.cpp)
target_link_libraries(fitnesse_fixture PRIVATE
        smallidea
        fitnesse-cppslim
        Boost::system
        Threads::Threads)

########

option(COVERAGE "Build coverage data" OFF)
if (COVERAGE)
    target_compile_options(smallidea PRIVATE --coverage -O0)
    target_link_libraries(smallidea PRIVATE gcov)
endif ()
