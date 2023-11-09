# scripts-xcode

Some common scripts that can be used as Xcode Run Script.

## Usage

Xcode Project -> Choose Target -> Build Phases -> Add Run Script Phase.

Then add the commend, e.g.:

```shell
SCRIPT_PATH="../scripts-xcode"
if [ -e $SCRIPT_PATH/swiftlint.sh ]; then
  $SCRIPT_PATH/swiftlint.sh $SCRIPT_PATH
else
  echo "File not found for Run Script (Swift Lint)."
fi
```

## swiftlint.sh

```markdown
./scripts-xcode/swiftlint.sh [PATH_TO_PARENT_CONFIG]

PATH_TO_PARENT_CONFIG:
- Provide a path to a parent config file if needed.  
- Leave it empty if you just need to use the .swiftlint.yml that located in the same folder of *.xcodeproj.
```
    
## Troubleshoot

If the script is unexecutable, just open your terminal and use the commend below to make it executable:

    $ chmod +x scripts-xcode/swiftlint.sh


