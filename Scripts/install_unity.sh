#! /bin/sh

BASE_URL=http://download.unity3d.com/download_unity
HASH=5a3967d8c55d
VERSION=5.4.4f1

mkdir -p $(pwd)/unity

download() {
    package=$1
    dst=$2
    url="$BASE_URL/$HASH/$package"

    echo "## Downloading from $url: "
    echo "## into $pwd/unity/$dst"
    curl -o $(pwd)/unity/$(dst) $(url)
}

install() {
    package=$1
    dst=$2
    download "$package" "$dst"

    echo "Installing $pwd/unity/$dst"
    sudo installer -dumplog -package $(pwd)/unity/$(dst) -target /
}

install "MacEditorInstaller/Unity-$VERSION.pkg" "unity.pkg"
install "MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-$VERSION.pkg" "unity.pkg"

sudo rm -rf $(pwd)/unity