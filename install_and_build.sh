export BRANCH=v1.3.0
export REPO_NAME=vr-app-2.0

export DOWNLOAD_DIR=downloads
export ANDROID_DIR=android
export BUILD_DIR=Build
export PROJECT_PATH=$(pwd)

sudo mkdir -p $DOWNLOAD_DIR
sudo mkdir -p $ANDROID_DIR
sudo mkdir -p $BUILD_DIR

sudo chmod +x install_android_sdk.sh
sudo chmod +x install_unity.sh
sudo chmod +x build_android.sh
sudo chmod +x close_unity.sh

./install_android_sdk.sh
./install_unity.sh

./build_android.sh
./close_unity.sh