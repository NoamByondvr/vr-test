#! /bin/sh

# Example build script for Unity3D project. See the entire example: https://github.com/JonathanPorta/ci-build

# Change this the name of your project. This will be the name of the final executables as well.

mkdir -p $(pwd)/Build/android

echo "Attempting to build Android"

/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/Build/unity.log \
  -projectPath $(pwd) \
  -quit \
  -executeMethod BuildMyGame.BuildAndroid "$(pwd)/Build/android/android.apk"

echo 'Logs from build'
cat $(pwd)/Build/unity.log