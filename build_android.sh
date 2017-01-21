#! /bin/sh

export BRANCH=v1.3.0
export REPO_NAME=vr-app-2.0

export DOWNLOAD_DIR=$PWD/downloads
export ANDROID_DIR=$PWD/android
export BUILD_DIR=$PWD/Build
export PROJECT_PATH=$PWD

mkdir -p $DOWNLOAD_DIR
mkdir -p $ANDROID_DIR
mkdir -p $BUILD_DIR


echo " #############################################################"
echo " ##############        BUILD ANDROID         #################"
echo " #############################################################"

echo "ls -l $ANDROID_DIR/build-tools"
ls -l $ANDROID_DIR

echo "ls -l $HOME/Library/Android/sdk/"
ls -l $HOME/Library/Android/sdk/

sudo /Applications/Unity/Unity.app/Contents/MacOS/Unity \
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