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
echo " ##############   RETURNING UNITY LICENSE      ###############"
echo " #############################################################"

echo "## Attempting to return Unity license"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
-batchmode \
-nographics \
-logFile $BUILD_DIR/unity_returnlicense.log \
-silent-crashes \
-quit \
-returnlicense

echo " #############################################################"
echo " ##############             THE END            ###############"
echo " #############################################################"