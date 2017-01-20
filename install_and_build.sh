#! /bin/sh

export BRANCH=v1.3.0
export REPO_NAME=vr-app-2.0

export DOWNLOAD_DIR=downloads
export ANDROID_DIR=android
export BUILD_DIR=Build
export PROJECT_PATH=/

sudo mkdir -p $DOWNLOAD_DIR
sudo mkdir -p $ANDROID_DIR
sudo mkdir -p $BUILD_DIR

echo " #############################################################"
echo " ##############      INSTALL ANDROID SDK     #################"
echo " #############################################################"
VERSION=r25.2.5

BASEURL=http://dl.google.com/android/repository
URL=$BASEURL/tools_$VERSION-macosx.zip

DST_ZIP=$DOWNLOAD_DIR/android-sdk.zip
sudo curl -o $DST_ZIP $URL
sudo unzip $DST_ZIP -d $ANDROID_DIR

echo "y" | sudo $ANDROID_DIR/tools/android update sdk --no-ui --all --filter \
tool,\
platform-tool,\
build-tools-25.0.2,\
build-tools-25.0.1,\
android-25,\
android-23,\
android-24.0.3,\
android-24.0.2,\
android-24.0.1,\
android-24,\
android-23.0.3,\
android-23.0.2,\
android-23.0.1,\
android-22.0.1,\
android-21.1.2,\
android-20,\
android-19.1,\
android-19

export ANDROID_HOME=$ANDROID_DIR
export ANDROID_SDK_ROOT=$ANDROID_DIR
export PATH=$PATH:$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=$(/usr/libexec/java_home)


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


echo " #############################################################"
echo " ##############        BUILD ANDROID         #################"
echo " #############################################################"

travis_wait 20 /Applications/Unity/Unity.app/Contents/MacOS/Unity \
    -batchmode \
    -nographics \
    -serial $UNITY_SERIAL
    -silent-crashes \
    -logFile $BUILD_DIR/unity_android.log \
    -projectPath $PROJECT_PATH \
    -quit \
    -executeMethod BuildMyGame.BuildAndroid $BUILD_DIR/android.apk

echo '## Logs from build'
cat $BUILD_DIR/unity_android.log

echo " #############################################################"
echo " ##############            BUILD iOS         #################"
echo " #############################################################"

travis_wait 20 /Applications/Unity/Unity.app/Contents/MacOS/Unity \
    -batchmode \
    -nographics \
    -serial $UNITY_SERIAL
    -silent-crashes \
    -logFile $BUILD_DIR/unity_ios.log \
    -projectPath $PROJECT_PATH \
    -quit \
    -executeMethod BuildMyGame.BuildiOS $BUILD_DIR/ios_build

echo '## Logs from build'
cat $BUILD_DIR/unity_ios.log

echo "## Attempting to return Unity license"
travis_wait 20 /Applications/Unity/Unity.app/Contents/MacOS/Unity \
    -batchmode \
    -nographics \
    -silent-crashes \
    -quit \
    -returnlicense

echo " #############################################################"
echo " ##############             THE END            ###############"
echo " #############################################################"