#!/bin/bash
#
# Xcode Run Script for Swift Lint.
#
# Usage (Add as Xcode Run Script Phase):
#
#   Option 1 (use the `.swiftlint.yml` that located in the same folder of *.xcodeproj):
#
#     ./scripts-xcode/swiftlint.sh
#
#   Option 2 (use the `swiftlint-default.yml` that's provided in /scripts-xcode):
#
#     ./scripts-xcode/swiftlint.sh default
#
#   Option 3 (use the custom path to your `.swiftlint.yml` file):
#   
#     ./scripts-xcode/swiftlint.sh path/to/your/custom/swiftlint_yml
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

  if [ $path == "default" ]; then
    swiftlint --config "scripts-xcode/swiftlint-default.yml"
  else
    # The path to one or more SwiftLint configuration files, evaluated as a parent-child hierarchy.
    swiftlint --config path
  fi
fi

