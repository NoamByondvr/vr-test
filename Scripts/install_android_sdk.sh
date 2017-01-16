#! /bin/sh

wget http://dl.google.com/android/repository/tools_r25.2.3-macosx.zip
unzip tools_r25.2.3-macosx.zip
export ANDROID_HOME=$PWD/android-sdk-macosx
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
echo yes | android update sdk --filter platform-tools --no-ui --force > /dev/null
echo yes | android update sdk --filter android-23 --no-ui --force > /dev/null
echo yes | android update sdk --filter android-24 --no-ui --force > /dev/null
echo yes | android update sdk --filter android-25 --no-ui --force > /dev/null
echo yes | android update sdk --filter build-tools-25 --all --no-ui --force > /dev/null
echo yes | android update sdk --filter build-tools-25.0.1 --all --no-ui --force > /dev/null
echo yes | android update sdk --filter build-tools-25.0.2 --all --no-ui --force > /dev/null