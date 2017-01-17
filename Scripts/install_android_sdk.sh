#! /bin/sh
mkdir -p $(pwd)/android-sdk

echo "## curl -o ./android-sdk/android-sdk.zip http://dl.google.com/android/repository/tools_r25.2.3-macosx.zip"
curl -o $(pwd)/android-sdk/android-sdk.zip http://dl.google.com/android/repository/tools_r25.2.3-macosx.zip

echo "## unzip ./android-sdk/android-sdk.zip"
unzip $(pwd)/android-sdk/android-sdk.zip

echo "y" | $(pwd)/android-sdk/tools/android update sdk --no-ui --all --filter tool,platform-tool,android-23,android-24,android-25,build-tools-25.0.1,build-tools-25.0.2

export ANDROID_HOME=$PWD/android-sdk/android-sdk-macosx
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=$(/usr/libexec/java_home)
