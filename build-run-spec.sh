#!/bin/bash
set -e
BUILDDIR=$(realpath $(mktemp -d build_XXXXXX))
echo -e "\n### $BUILDDIR ###\n"
cd $BUILDDIR

cmake ..
make

exec ./smallidea_spec
