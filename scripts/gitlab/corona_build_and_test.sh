#!/bin/bash

export HOSTNAME=`hostname`
echo -e "Hostname:" ${HOSTNAME}
mkdir build-gitlab-corona && mkdir install-gitlab-corona
cd build-gitlab-corona
export HOST_CONFIG=`ls ../host-configs/corona-4.18.0toss-x86_64-gcc@10.3.1-rocm@5.2.cmake`
echo -e "HOST_CONFIG:" ${HOST_CONFIG}
echo -e "PWD:" ${PWD}
cmake -C ${HOST_CONFIG} -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../install-gitlab-corona -DBUILD_TESTS=ON -DENABLE_WARNINGS=ON ../src
make VERBOSE=1
make install
env CTEST_OUTPUT_ON_FAILURE=1 make test
cd ..
echo -e "PWD:" ${PWD}
which cmake
cmake --version
cd install-gitlab-corona/examples/using-with-cmake/c
echo -e "PWD:" ${PWD}
mkdir _test_build
cd _test_build
cmake ../
make VERBOSE=1
./variorum-print-power-example
cd ../../../using-with-make/c
echo -e "PWD:" ${PWD}
make VERBOSE=1
./variorum-print-power-example
cd ../../using-with-make/cpp
echo -e "PWD:" ${PWD}
make VERBOSE=1
./variorum-print-power-example
cd ../../using-with-make/fortran
echo -e "PWD:" ${PWD}
make VERBOSE=1 FFLAGS+=-fallow-invalid-boz
./ep.W.x

#
