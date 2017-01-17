#! /bin/sh

# Example install script for Unity3D project. See the entire example: https://github.com/JonathanPorta/ci-build

# This link changes from time to time. I haven't found a reliable hosted installer package for doing regular
# installs like this. You will probably need to grab a current link from: http://unity3d.com/get-unity/download/archive

echo '## Downloading Android package from http://download.unity3d.com/download_unity/5a3967d8c55d/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-5.4.4f1.pkg: '
curl -o unity/unity-ios.pkg http://download.unity3d.com/download_unity/5a3967d8c55d/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-5.4.4f1.pkg

echo '## Installing Android.pkg'
sudo installer -dumplog -package unity/unity-ios -target /unity