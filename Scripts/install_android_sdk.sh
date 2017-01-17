#! /bin/sh

echo "wget http://dl.google.com/android/repository/tools_r25.2.3-macosx.zip"
wget http://dl.google.com/android/repository/tools_r25.2.3-macosx.zip

echo "unzip tools_r25.2.3-macosx.zip"
unzip tools_r25.2.3-macosx.zip

# echo "export ANDROID_HOME=$PWD/android-sdk-macosx"
# export ANDROID_HOME=$PWD/android-sdk-macosx

# echo "export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools"
# export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

echo "yes | ./android-sdk-macosx/tools/android update sdk --filter platform-tools --no-ui --force > /dev/null"
echo yes | ./android-sdk-macosx/tools/android update sdk --filter platform-tools --no-ui --force > /dev/null

echo "yes | ./android-sdk-macosx/tools/android update sdk --filter android-23 --no-ui --force > /dev/null"
echo yes | ./android-sdk-macosx/tools/android update sdk --filter android-23 --no-ui --force > /dev/null

echo "yes | ./android-sdk-macosx/tools/android update sdk --filter android-24 --no-ui --force > /dev/null"
echo yes | ./android-sdk-macosx/tools/android update sdk --filter android-24 --no-ui --force > /dev/null

echo "yes | ./android-sdk-macosx/tools/android update sdk --filter android-25 --no-ui --force > /dev/null"
echo yes | ./android-sdk-macosx/tools/android update sdk --filter android-25 --no-ui --force > /dev/null

echo "yes | ./android-sdk-macosx/tools/android update sdk --filter build-tools-25 --all --no-ui --force > /dev/null"
echo yes | ./android-sdk-macosx/tools/android update sdk --filter build-tools-25 --all --no-ui --force > /dev/null

echo "yes | ./android-sdk-macosx/tools/android update sdk --filter build-tools-25.0.1 --all --no-ui --force > /dev/null"
echo yes | ./android-sdk-macosx/tools/android update sdk --filter build-tools-25.0.1 --all --no-ui --force > /dev/null

echo "yes | ./android-sdk-macosx/tools/android update sdk --filter build-tools-25.0.2 --all --no-ui --force > /dev/null"
echo yes | ./android-sdk-macosx/tools/android update sdk --filter build-tools-25.0.2 --all --no-ui --force > /dev/null

export ANDROID_HOME=./android-sdk-macosx
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/25.0.2