#! /bin/sh

BASE_URL=http://download.unity3d.com/download_unity
HASH=5a3967d8c55d
VERSION=5.4.4f1

DOWNLOAD_DIR=$HOME/.cache/downloads

mkdir -p $(pwd)/unity

download() {
    url=$1
    dst=$2
    echo "## Downloading from: $url"
    echo "## to: $dst"
    curl -o $(dst) $(url)
}

install() {

    package=$1
    file_name=$2

    if [ -f "$DST_ZIP" ];
    then
        echo "File $DST_ZIP exist."
    else
        download "$BASE_URL/$HASH/$package" "$DOWNLOAD_DIR/$file_name"

    	echo "Installing $DOWNLOAD_DIR/$file_name"
    	sudo installer -dumplog -package $(DOWNLOAD_DIR)/$(file_name) -target /
    fi
}

install "MacEditorInstaller/Unity-$VERSION.pkg" "$VERSION.pkg"
install "MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-$VERSION.pkg" "unity.pkg"