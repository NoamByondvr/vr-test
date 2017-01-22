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
echo " ##############       SET UNITY PARAMS       #################"
echo " #############################################################"

/Applications/Unity/Unity.app/Contents/MacOS/Unity \
-batchmode \
-nographics \
-androidSdkPath $ANDROID_DIR \
-logFile $BUILD_DIR/set_unity_params.log \
-projectPath $PROJECT_PATH \
-silent-crashes \
-quit \
-executeMethod BuildCmd.setEnvParams

echo '## Logs from build'
cat $BUILD_DIR/set_unity_params.log