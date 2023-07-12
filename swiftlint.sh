#!/bin/bash
#
# Xcode Run Script for Swift Lint.
#

# Skip running this scirpt if we are running previews or tests.
if [ "${ENABLE_PREVIEWS}" = "YES" ] || [ "${CONFIGURATION}" = "XCTest" ]
then 
  echo "Skipping script when running preivews or tests"
  exit 0
fi

# Do nothing if SwiftLint is unavailable.
if ! command -v swiftlint &> /dev/null; then
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
  exit 0
fi

# Get arg for the path of .swiftlint.yml file.
if [ -z $1 ]; then
  swiftlint
else
  path=$1

  if [ $path == "none" ]; then
    swiftlint
  elif [ $path == "default" ]; then
    swiftlint --config scripts-xcode/swiftlint-default.yml
  elif [ $path == "override" ]; then
    swiftlint --config scripts-xcode/swiftlint-default.yml --config .swiftlint.yml
  else
    swiftlint --config path
  fi
fi

