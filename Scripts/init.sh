#! /bin/sh

export DOWNLOAD_DIR=$HOME/.cache/downloads
export ANDROID_DIR=$HOME/.cache/android
export TMP=$HOME/.tmp
export BUILD_DIR=$pwd/../Build

mkdir -p $DOWNLOAD_DIR
mkdir -p $ANDROID_DIR
mkdir -p $TMP
sudo mkdir -p $BUILD_DIR