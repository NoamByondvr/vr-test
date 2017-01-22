#! /bin/sh

export BRANCH=v1.3.0
export REPO_NAME=vr-app-2.0

export DOWNLOAD_DIR=$HOME/Downloads
export ANDROID_DIR=$HOME/Library/Android/sdk
export BUILD_DIR=$PWD/Build
export PROJECT_PATH=$PWD

mkdir -p $DOWNLOAD_DIR
mkdir -p $ANDROID_DIR
mkdir -p $BUILD_DIR

echo " #############################################################"
echo " ##############            BUILD iOS         #################"
echo " #############################################################"

sudo /Applications/Unity/Unity.app/Contents/MacOS/Unity \
-batchmode \
-nographics \
-logFile $BUILD_DIR/unity_ios.log \
-buildpath $BUILD_DIR/ios_build \
-projectPath $PROJECT_PATH \
-silent-crashes \
-quit \
-executeMethod BuildMyGame.BuildiOS $BUILD_DIR/ios_build

echo '## Logs from build'
cat $BUILD_DIR/unity_ios.log

# -serial $UNITY_SERIAL \
