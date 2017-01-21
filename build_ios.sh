#! /bin/sh

export BRANCH=v1.3.0
export REPO_NAME=vr-app-2.0

export DOWNLOAD_DIR=downloads
export ANDROID_DIR=android
export BUILD_DIR=Build
export PROJECT_PATH=$(pwd)

sudo mkdir -p $DOWNLOAD_DIR
sudo mkdir -p $ANDROID_DIR
sudo mkdir -p $BUILD_DIR

echo " #############################################################"
echo " ##############            BUILD iOS         #################"
echo " #############################################################"

/Applications/Unity/Unity.app/Contents/MacOS/Unity \
-batchmode \
-nographics \
-serial $UNITY_SERIAL \
-logFile $BUILD_DIR/unity_ios.log \
-projectPath $PROJECT_PATH \
-quit \
-executeMethod BuildMyGame.BuildiOS $BUILD_DIR/ios_build

echo '## Logs from build'
cat $BUILD_DIR/unity_ios.log
