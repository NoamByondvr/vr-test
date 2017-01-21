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
echo " ##############        BUILD ANDROID         #################"
echo " #############################################################"

ls -l $ANDROID_DIR/build-tools

/Applications/Unity/Unity.app/Contents/MacOS/Unity \
-batchmode \
-nographics \
-androidSdkPath $ANDROID_DIR \
-serial $UNITY_SERIAL \
-buildpath $BUILD_DIR/android.apk \
-logFile $BUILD_DIR/unity_android.log \
-projectPath $PROJECT_PATH \
-quit \
-executeMethod BuildMyGame.BuildAndroid

echo '## Logs from build'
cat $BUILD_DIR/unity_android.log