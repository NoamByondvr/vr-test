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
    -serial $UNITY_SERIAL
    -silent-crashes \
    -logFile $BUILD_DIR/unity.log \
    -projectPath $PROJECT_PATH \
    -quit \
    -executeMethod BuildMyGame.BuildAndroid $BUILD_DIR/android.apk




#  -androidSdkPath $ANDROID_DIR \

# can add -serial $UNITY_SERIAL
# sleep 1m

echo '## Logs from build'
cat $BUILD_DIR/unity.log

echo "## Attempting to return Unity license"

/Applications/Unity/Unity.app/Contents/MacOS/Unity \
    -batchmode \
    -nographics \
    -silent-crashes \
    -quit \
    -returnlicense
