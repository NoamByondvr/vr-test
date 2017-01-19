#! /bin/sh

/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -logFile $PWD/../Build/unity.log \
  -projectPath $PWD/../ \
  -quit \
  -executeMethod BuildMyGame.BuildAndroid $PWD/../Build/android.apk

#  -androidSdkPath $ANDROID_DIR \

# can add -serial $UNITY_SERIAL
# sleep 1m

echo '## Logs from build'
cat $PWD/../Build/unity.log