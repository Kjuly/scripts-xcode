#!/bin/bash
#
# Xcode Run Script for Swift Lint.
#
# Usage (Add as Xcode Run Script Phase):
#
#   ./scripts-xcode/swiftlint.sh
#

# Skip running this scirpt if we are running previews or tests.
if [ "${ENABLE_PREVIEWS}" = "YES" ] || [ "${CONFIGURATION}" = "XCTest" ]
then 
  echo "Skipping script when running preivews or tests"
  exit 0
fi

# Run SwiftLint if it's available.
if which swiftlint > /dev/null; then
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi

