#!/bin/bash
set -e
BUILDDIR=$(realpath $(mktemp -d build_XXXXXX))
INFOFILE=smallidea.info
COVERAGEFOLDER=$BUILDDIR/../coverage/

echo -e "\n### $BUILDDIR ###\n"
cd $BUILDDIR

# make sure your target has compiled/linked with "--coverage" on CXXFLAGS and LDFLAGS

cmake .. -DCOVERAGE=ON
make

# https://qiaomuf.wordpress.com/2011/05/26/use-gcov-and-lcov-to-know-your-test-coverage/
#lcov --base-directory . --directory . --zerocounters -q

./smallidea_spec

lcov --rc lcov_branch_coverage=1 --base-directory . --directory . -c -o ${INFOFILE}
lcov --rc lcov_branch_coverage=1 --remove ${INFOFILE} "/usr*" -o ${INFOFILE} # remove output for external libraries
rm -rf ${COVERAGEFOLDER}
genhtml --branch-coverage --show-details -o ${COVERAGEFOLDER} -t "${INFOFILE} test coverage" --num-spaces 4 ${INFOFILE}

echo "Coverage report here: ${COVERAGEFOLDER}"