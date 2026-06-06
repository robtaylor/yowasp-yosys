#!/bin/sh -ex

export SOURCE_DATE_EPOCH=$(git log -1 --format=%ct)

WASI_VER=33
WASI_SDK=wasi-sdk-${WASI_VER}.0-x86_64-linux
WASI_SDK_URL=https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-${WASI_VER}/${WASI_SDK}.tar.gz
if ! [ -d ${WASI_SDK} ]; then curl -L ${WASI_SDK_URL} | tar xzf -; fi
WASI_SDK_PATH=$(pwd)/${WASI_SDK}

# TODO(bin): drop CMAKE_EXECUTABLE_SUFFIX workaround once wasi-sdk#633 is addressed.
echo 'set(CMAKE_EXECUTABLE_SUFFIX ".wasm")' >> ${WASI_SDK_PATH}/share/cmake/Platform/WASI.cmake

cmake -B yosys-build -S yosys-src \
  -DCMAKE_TOOLCHAIN_FILE=${WASI_SDK_PATH}/share/cmake/wasi-sdk-p1.cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DYOSYS_COMPILER_LAUNCHER=ccache \
  -DYOSYS_WITHOUT_ZLIB=ON \
  -DYOSYS_WITHOUT_LIBFFI=ON \
  -DYOSYS_WITHOUT_READLINE=ON \
  -DYOSYS_WITHOUT_EDITLINE=ON \
  -DYOSYS_WITHOUT_TCL=ON

cmake --build yosys-build --parallel $(nproc)
