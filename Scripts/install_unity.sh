#! /bin/sh

HASH=5a3967d8c55d
VERSION=5.4.4f1
BASE_URL=http://download.unity3d.com/download_unity


download() {
    url=$2
    dst=$1
    echo "## Downloading from: $url"
    echo "## to: $dst"
    sudo curl -o $dst $url
}

install() {
    package=$1
    file_name=$2
    target_url=$BASE_URL/$HASH/$package
    target_file=$DOWNLOAD_DIR/$file_name

    if [ -f "$target_file" ];
    then
        echo "## File $target_file exist."
    else
        download "$target_file" "$target_url"
    fi

    echo "## Installing $DOWNLOAD_DIR/$file_name"
    sudo installer -dumplog -package $DOWNLOAD_DIR/$file_name -target /
}

if [ -f "$APP_DIR/Unity/Unity.app/Contents/MacOS/Unity" ];
then
    echo "## File $APP_DIR/Applications/Unity/Unity.app/Contents/MacOS/Unity exist."
else
    install "MacEditorInstaller/Unity-$VERSION.pkg" "$VERSION.pkg"
fi

install "MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-$VERSION.pkg" "android-unity.pkg"
install "MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-$VERSION.pkg" "ios-unity.pkg"