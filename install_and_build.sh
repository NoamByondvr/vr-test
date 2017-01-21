export BRANCH=v1.3.0
export REPO_NAME=vr-app-2.0

export DOWNLOAD_DIR=$PWD/downloads
export ANDROID_DIR=$PWD/android
export BUILD_DIR=$PWD/Build
export PROJECT_PATH=$PWD

mkdir -p $DOWNLOAD_DIR
mkdir -p $ANDROID_DIR
mkdir -p $BUILD_DIR

./install_android_sdk.sh
./install_unity.sh

./build_android.sh
./close_unity.sh