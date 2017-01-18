#! /bin/sh

echo "## Attempting to build Android"

sudo /Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(BUILD_DIR)/unity.log \
  -projectPath $(pwd) \
  -quit \
  -executeMethod BuildMyGame.BuildAndroid "$(BUILD_DIR)/android.apk"

echo '## Logs from build'
cat $(BUILD_DIR)/unity.log