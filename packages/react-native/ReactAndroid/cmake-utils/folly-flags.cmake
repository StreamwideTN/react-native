# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

cmake_minimum_required(VERSION 3.13)
set(CMAKE_VERBOSE_MAKEFILE on)

# This CMake file exposes the Folly Flags that all the libraries should use when
# compiling/linking against a dependency which requires folly.

if (CMAKE_C_COMPILER_ID MATCHES "Clang|GNU")
    add_compile_options(-fstack-protector-strong)
    add_link_options(-fstack-protector-strong)
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_FORTIFY_SOURCE=2 -O2 -fPIC")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_FORTIFY_SOURCE=2 -O2 -fPIC")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden -fno-strict-aliasing")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fvisibility=hidden -fno-strict-aliasing")

SET(folly_FLAGS
        -DFOLLY_NO_CONFIG=1
        -DFOLLY_HAVE_CLOCK_GETTIME=1
        -DFOLLY_USE_LIBCPP=1
        -DFOLLY_CFG_NO_COROUTINES=1
        -DFOLLY_MOBILE=1
        -DFOLLY_HAVE_RECVMMSG=1
        -DFOLLY_HAVE_PTHREAD=1
        # Once we target android-23 above, we can comment
        # the following line. NDK uses GNU style stderror_r() after API 23.
        -DFOLLY_HAVE_XSI_STRERROR_R=1
        )
