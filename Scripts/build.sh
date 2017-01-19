#! /bin/sh

echo "##############################"
echo "##############################"
echo "##############################"
echo "##############################"
ls -l $ANDROID_DIR

echo "## Attempting to build Android"

/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $BUILD_DIR/unity.log \
  -projectPath $PROJECT_PATH \
  -quit \
  -executeMethod BuildMyGame.BuildiOS $BUILD_DIR/android.apk

#  -androidSdkPath $ANDROID_DIR \

# can add -serial $UNITY_SERIAL
# sleep 1m

echo '## Logs from build'
cat $BUILD_DIR/unity.log