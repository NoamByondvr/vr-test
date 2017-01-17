#! /bin/sh

echo "wget http://dl.google.com/android/repository/tools_r25.2.3-macosx.zip"
curl -o android-sdk.zip http://dl.google.com/android/repository/tools_r25.2.3-macosx.zip

echo "unzip android-sdk.zip"
unzip android-sdk.zip

export ANDROID_HOME=$PWD/android-sdk-macosx
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=$(/usr/libexec/java_home)

echo "y" | android update sdk --no-ui --all --filter tool,platform-tool,android-23,android-24,android-25,build-tools-25.0.1,build-tools-25.0.2

# echo "yes | ./tools/android update sdk --filter platform-tools --no-ui --force > /dev/null"
# echo yes | ./tools/android update sdk --filter platform-tools --no-ui --force > /dev/null

# echo "yes | ./tools/android update sdk --filter android-23 --no-ui --force > /dev/null"
# echo yes | ./tools/android update sdk --filter android-23 --no-ui --force > /dev/null

# echo "yes | ./tools/android update sdk --filter android-24 --no-ui --force > /dev/null"
# echo yes | ./tools/android update sdk --filter android-24 --no-ui --force > /dev/null

# echo "yes | ./tools/android update sdk --filter android-25 --no-ui --force > /dev/null"
# echo yes | ./tools/android update sdk --filter android-25 --no-ui --force > /dev/null

# echo "yes | ./tools/android update sdk --filter build-tools-25 --all --no-ui --force > /dev/null"
# echo yes | ./tools/android update sdk --filter build-tools-25 --all --no-ui --force > /dev/null

# echo "yes | ./tools/android update sdk --filter build-tools-25.0.1 --all --no-ui --force > /dev/null"
# echo yes | ./tools/android update sdk --filter build-tools-25.0.1 --all --no-ui --force > /dev/null

# echo "yes | ./tools/android update sdk --filter build-tools-25.0.2 --all --no-ui --force > /dev/null"
# echo yes | ./tools/android update sdk --filter build-tools-25.0.2 --all --no-ui --force > /dev/null

# export PATH=${PATH}/tools/platform-tools/build-tools/25.0.2