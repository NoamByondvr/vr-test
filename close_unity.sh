#! /bin/sh

export BRANCH=v1.3.0
export REPO_NAME=vr-app-2.0

export DOWNLOAD_DIR=downloads
export ANDROID_DIR=android
export BUILD_DIR=Build
export PROJECT_PATH=$(pwd)

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
-quit \
-returnlicense

echo " #############################################################"
echo " ##############             THE END            ###############"
echo " #############################################################"