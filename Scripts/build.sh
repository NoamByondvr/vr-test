#! /bin/sh

DOWNLOAD_DIR=$HOME/.cache/downloads
ANDROID_DIR=$HOME/.cache/android
TMP=$HOME/.tmp
BUILD_DIR=$pwd/Build

echo "Attempting to build Android"

/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(BUILD_DIR)/unity.log \
  -projectPath $(pwd) \
  -quit \
  -executeMethod BuildMyGame.BuildAndroid "$(BUILD_DIR)/android.apk"

echo 'Logs from build'
cat $(BUILD_DIR)/unity.log