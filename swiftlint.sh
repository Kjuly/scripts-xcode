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

# When running scripts in Xcode, `.bash_profile` might not be considered.
# REF: 
# - https://github.com/realm/SwiftLint/issues/2992
# - https://stackoverflow.com/questions/58741453/swiftlint-setup-with-xcode/58745018#58745018
if test -d "/usr/local/bin/"; then
  PATH="/usr/local/bin/:${PATH}"
fi
export PATH

# Do nothing if SwiftLint is unavailable.
if ! command -v swiftlint &> /dev/null; then
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
  exit 0
fi

# Get arg for the path of .swiftlint.yml file.
if [ -z $1 ]; then
  swiftlint
else
  SCRIPT_PATH=$1

  # If `.swiftlint.yml` exists, it'll be treated as `child_config`.
  # A child config is treated as a refinement and therefore has a higher priority.
  if [ -e .swiftlint.yml ]; then
    set -x
    swiftlint --config "$SCRIPT_PATH/swiftlint-default.yml" --config .swiftlint.yml
  else
    set -x
    swiftlint --config "$SCRIPT_PATH/swiftlint-default.yml"
  fi

  { set +x; } &> /dev/null
fi

