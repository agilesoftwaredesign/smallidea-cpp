#!/bin/bash
set -e
BASE=$(dirname $(realpath $0))
BUILDDIR=$(realpath $(mktemp -d build_XXXXXX))
FITNESSEJAR=${BASE}/3rdparty/fitnesse-cppslim/fitnesse-standalone-2018-01-27.jar

echo -e "\n### $BUILDDIR ###\n"
cd $BUILDDIR

cmake ..
make fitnesse_fixture

cd ${BASE}/acceptance-spec/
exec java -Dslim.port=0 -Dfixture.path=${BUILDDIR} -jar ${FITNESSEJAR} -c "FooSpecificationSuite?suite&format=text&excludeSuiteFilter=disabledOnBuildSystem"
