# scripts-xcode

Some common scripts that can be used as Xcode Run Script.

## Usage

Xcode Project -> Choose Target -> Build Phases -> Add Run Script Phase.

Then add the commend, e.g.:

    ./scripts-xcode/swiftlint.sh

## swiftlint.sh

- Option 1 (use the `.swiftlint.yml` that located in the same folder of *.xcodeproj):

      ./scripts-xcode/swiftlint.sh

- Option 2 (use the `swiftlint-default.yml` that's provided in /scripts-xcode):

      ./scripts-xcode/swiftlint.sh default

- Option 3 (use the custom path to your `.swiftlint.yml` file):
   
      ./scripts-xcode/swiftlint.sh path/to/your/custom/swiftlint_yml


## Troubleshoot

If the script is unexecutable, just open your terminal and use the commend below to make it executable:

    $ chmod +x scripts-xcode/swiftlint.sh

