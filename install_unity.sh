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
echo " ##############        INSTALL UNITY         #################"
echo " #############################################################"

HASH=38b4efef76f0
VERSION=5.5.0f3
BASE_URL=http://download.unity3d.com/download_unity

UNITY_URL=$BASE_URL/$HASH/MacEditorInstaller/Unity-$VERSION.pkg
curl -o $DOWNLOAD_DIR/unity.pkg $UNITY_URL
sudo installer -dumplog -package $DOWNLOAD_DIR/unity.pkg -target /

echo " #############################################################"
echo " ############  INSTALL UNITY ANDROID PLAYER  #################"
echo " #############################################################"

UNITY_ANDROID_URL=$BASE_URL/$HASH/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-$VERSION.pkg
curl -o $DOWNLOAD_DIR/unity_android.pkg $UNITY_ANDROID_URL
sudo installer -dumplog -package $DOWNLOAD_DIR/unity_android.pkg -target /