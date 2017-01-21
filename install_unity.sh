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
echo " ##############        INSTALL UNITY         #################"
echo " #############################################################"

HASH=38b4efef76f0
VERSION=5.5.0f3
BASE_URL=http://download.unity3d.com/download_unity
UNITY_URL=$BASE_URL/$HASH/MacEditorInstaller/Unity-$VERSION.pkg
UNITY_ANDROID_URL=$BASE_URL/$HASH/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-$VERSION.pkg

sudo curl -o $DOWNLOAD_DIR/unity.pkg $UNITY_URL
sudo curl -o $DOWNLOAD_DIR/unity_android.pkg $UNITY_ANDROID_URL

sudo installer -dumplog -package $DOWNLOAD_DIR/unity.pkg -target /
sudo installer -dumplog -package $DOWNLOAD_DIR/unity_android.pkg -target /