#! /bin/sh

# Example install script for Unity3D project. See the entire example: https://github.com/JonathanPorta/ci-build

# This link changes from time to time. I haven't found a reliable hosted installer package for doing regular
# installs like this. You will probably need to grab a current link from: http://unity3d.com/get-unity/download/archive
uname -a

echo 'Downloading from http://download.unity3d.com/download_unity/5a3967d8c55d/MacEditorInstaller/Unity-5.4.4f1.pkg: '
curl -o Unity.pkg http://download.unity3d.com/download_unity/5a3967d8c55d/MacEditorInstaller/Unity-5.4.4f1.pkg

echo 'Installing Unity.pkg'
sudo installer -package Unity.pkg -target /

echo 'Downloading Android package from http://download.unity3d.com/download_unity/b7e030c65c9b/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-5.4.4f1.pkg: '
curl -o Android.pkg http://download.unity3d.com/download_unity/b7e030c65c9b/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-5.4.4f1.pkg

echo 'Installing Android.pkg'
sudo installer -pkg Android.pkg -target /
