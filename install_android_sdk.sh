#! /bin/sh

export BRANCH=v1.3.0
export REPO_NAME=vr-app-2.0

export DOWNLOAD_DIR=$PWD/downloads
export ANDROID_DIR=$PWD/android
export BUILD_DIR=$$PWD/Build
export PROJECT_PATH=$PWD

mkdir -p $DOWNLOAD_DIR
mkdir -p $ANDROID_DIR
mkdir -p $BUILD_DIR

echo " #############################################################"
echo " ##############      INSTALL ANDROID SDK     #################"
echo " #############################################################"

VERSION=r25.2.5

BASEURL=http://dl.google.com/android/repository
URL=$BASEURL/tools_$VERSION-macosx.zip

DST_ZIP=$DOWNLOAD_DIR/android-sdk.zip
curl -o $DST_ZIP $URL
unzip $DST_ZIP -d $ANDROID_DIR

export ANDROID_HOME=$ANDROID_DIR
export PATH=${PATH}:$ANDROID_DIR/tools
export PATH=${PATH}:$ANDROID_DIR/platform-tools
export PATH=${PATH}:$ANDROID_DIR

echo yes | android update sdk --filter platform-tool --no-ui --force > /dev/null
echo yes | android update sdk --filter tool --no-ui --force > /dev/null

echo yes | android update sdk --filter android-25 --no-ui --force > /dev/null
echo yes | android update sdk --filter android-24 --no-ui --force > /dev/null
echo yes | android update sdk --filter android-23 --no-ui --force > /dev/null
echo yes | android update sdk --filter android-22 --no-ui --force > /dev/null
echo yes | android update sdk --filter android-21 --no-ui --force > /dev/null
echo yes | android update sdk --filter android-19 --no-ui --force > /dev/null

echo yes | android update sdk --filter build-tools-25.0.2 --all --no-ui --force > /dev/null
echo yes | android update sdk --filter build-tools-25.0.1 --all --no-ui --force > /dev/null

echo yes | android update sdk --filter build-tools-24.0.3 --all --no-ui --force > /dev/null
echo yes | android update sdk --filter build-tools-24.0.2 --all --no-ui --force > /dev/null
echo yes | android update sdk --filter build-tools-24.0.1 --all --no-ui --force > /dev/null

echo yes | android update sdk --filter build-tools-23.0.3 --all --no-ui --force > /dev/null
echo yes | android update sdk --filter build-tools-23.0.2 --all --no-ui --force > /dev/null
echo yes | android update sdk --filter build-tools-23.0.1 --all --no-ui --force > /dev/null

echo yes | android update sdk --filter build-tools-21.1.2 --all --no-ui --force > /dev/null

echo yes | android update sdk --filter extra-android-m2repository --no-ui --force > /dev/null









# BASEURL=http://dl.google.com/android/repository
# URL=$BASEURL/tools_$VERSION-macosx.zip

# DST_ZIP=$DOWNLOAD_DIR/android-sdk.zip
# sudo curl -o $DST_ZIP $URL
# sudo unzip $DST_ZIP -d $ANDROID_DIR

# export ANDROID_HOME=$ANDROID_DIR
# export ANDROID_SDK_ROOT=$ANDROID_DIR
# export PATH=$PATH:$ANDROID_HOME
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export JAVA_HOME=$(/usr/libexec/java_home)

# echo "y" | sudo $ANDROID_DIR/tools/android update sdk --no-ui --all --filter \
# tool,\
# platform-tool,\
# build-tools-25.0.2,\
# build-tools-25.0.1,\
# android-25,\
# android-23,\
# android-24.0.3,\
# android-24.0.2,\
# android-24.0.1,\
# android-24,\
# android-23.0.3,\
# android-23.0.2,\
# android-23.0.1,\
# android-22.0.1,\
# android-21.1.2,\
# android-20,\
# android-19.1,\
# android-19