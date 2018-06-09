#!/bin/bash

# Set up the source file
echo "//List of files to index" > ${SOURCE_ROOT}/FilesToIndex.cpp

# Find all the C++ files
echo "Finding source files in $SOURCE_ROOT"
pushd ${SOURCE_ROOT}/../../src > /dev/null
SOURCES=$(find . -name *hpp | sort | xargs)
for SOURCE in $SOURCES
do
echo "#include \"$SOURCE\"" >> ${SOURCE_ROOT}/FilesToIndex.cpp
done
popd > /dev/null
