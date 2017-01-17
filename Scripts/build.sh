#! /bin/sh

# Example build script for Unity3D project. See the entire example: https://github.com/JonathanPorta/ci-build

# Change this the name of your project. This will be the name of the final executables as well.

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