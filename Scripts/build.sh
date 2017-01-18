#! /bin/sh

echo "## Attempting to build Android"

/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile Build/unity.log \
  -projectPath $(pwd) \
  -quit \
  -executeMethod BuildMyGame.BuildAndroid Build/android.apk

echo '## Logs from build'
cat Build/unity.log