# scripts-xcode

Some common scripts that can be used as Xcode Run Script.

## Usage

Xcode Project -> Choose Target -> Build Phases -> Add Run Script Phase.

Then add the commend, e.g.:

    ./scripts-xcode/swiftlint.sh

## Troubleshoot

If the script is unexecutable, just open your terminal and use the commend below to make it executable:

    $ chmod +x scripts-xcode/swiftlint.sh

