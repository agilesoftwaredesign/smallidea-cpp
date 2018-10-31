#!/bin/bash
BASE=$(dirname $(realpath $0))
FITNESSE_FIXTURE_BIN_PREFIX=${FITNESSE_FIXTURE_BIN_PREFIX:-$BASE/cmake-build-debug/}
FITNESSEJAR=${BASE}/3rdparty/fitnesse-cppslim/fitnesse-standalone-2018-01-27.jar

cd ${BASE}/acceptance-spec/
java -Dslim.port=0 -Dfixture.path=${FITNESSE_FIXTURE_BIN_PREFIX} -jar ${FITNESSEJAR} -p 8080
