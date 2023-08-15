# scripts-xcode

Some common scripts that can be used as Xcode Run Script.

## Usage

Xcode Project -> Choose Target -> Build Phases -> Add Run Script Phase.

Then add the commend, e.g.:

```shell
SWIFT_LINT=./scripts-xcode/swiftlint.sh
if [ ! -f $SWIFT_LINT ]; then
  echo "File not found for Rune Script (Swift Lint)."
  exit
fi
SWIFT_LINT default 
```

## swiftlint.sh

```markdown
./scripts-xcode/swiftlint.sh [OPTIONS]

OPTIONS:
- none (or just leave it empty): Use the .swiftlint.yml that located in the same folder of *.xcodeproj.
- default: Use the swiftlint-default.yml that's provided.
- override: Use both swiftlint-default.yml & .swiftlint.yml.
- "path/to/custom/.swiftlint.yml": Use the path to a custom .swiftlint.yml file.
```
    
Note for option **override**: It's same to the option **none** with a line at the top of the `.swiftlint.yml` file:

    parent_config: scripts-xcode/swiftlint-default.yml

## Troubleshoot

If the script is unexecutable, just open your terminal and use the commend below to make it executable:

    $ chmod +x scripts-xcode/swiftlint.sh


