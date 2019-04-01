#! /bin/sh

## Build the project
echo "Building project for Windows..."
mkdir $UNITY_BUILD_DIR
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile \
  -projectPath "$PROJECT_PATH" \
  -buildWindows64Player  "$(pwd)/build/win/ci-build.exe" \
  -quit \
  | tee "$LOG_FILE"
  
if [ $? = 0 ] ; then
  echo "Building Windows exe completed successfully."
  ERROR_CODE=0
else
  echo "Building Windows exe failed. Exited with $?."
  ERROR_CODE=1
fi

#echo 'Build logs:'
#cat $LOG_FILE

echo "Finishing with code $ERROR_CODE"
exit $ERROR_CODE