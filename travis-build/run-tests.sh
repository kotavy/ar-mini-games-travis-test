#! /bin/sh

PROJECT_PATH=$(pwd)/$UNITY_PROJECT_PATH
UNITY_BUILD_DIR=$(pwd)/Build
LOG_FILE=$UNITY_BUILD_DIR/unity-win.log

ERROR_CODE=0
echo "Items in project path ($PROJECT_PATH):"
ls "$PROJECT_PATH"

## Run the editor unit tests
echo "Running editor unit tests for ${PROJECT_PATH}"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unity.log \
  -projectPath "$(pwd)/${PROJECT_PATH}" \
  -runEditorTests \
  -editorTestsResultFile $(pwd)/test.xml \
  -quit

rc0=$?
echo "Unit test logs"
cat $(pwd)/test.xml
# exit if tests failed
if [ $rc0 -ne 0 ]; then { echo "Failed unit tests"; exit $rc0; } fi