#! /bin/sh

VERSION=r25.2.3

BASEURL=http://dl.google.com/android/repository
URL=$BASEURL/tools_$VERSION-macosx.zip

DST_ZIP=$DOWNLOAD_DIR/android-sdk.zip

if [ -f "$DST_ZIP" ];
then
   echo "File $DST_ZIP exist."
else

    echo "## curl -o $DST_ZIP $URL"
    curl -o $DST_ZIP $URL

    echo "## unzip $DST_ZIP -d $ANDROID_DIR"
    unzip $DST_ZIP -d $ANDROID_DIR

	echo "y" | $ANDROID_DIR/tools/android update sdk --no-ui --all --filter /
	tool,platform-tool,android-23,android-24,android-25,build-tools-25.0.1,build-tools-25.0.2
fi

export ANDROID_HOME=$ANDROID_DIR/android-sdk-macosx
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=$(/usr/libexec/java_home)
