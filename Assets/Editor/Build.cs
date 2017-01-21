using System;
using System.Linq;
using System.IO;
using UnityEditor;
using UnityEngine;

public class BuildMyGame {

    [MenuItem("Build/Build Android", false, 0)]
    public static void BuildAndroid() {
        PlayerSettings.Android.minSdkVersion = AndroidSdkVersions.AndroidApiLevel19;

        PlayerSettings.bundleIdentifier = "com.ccccc.ppppp";
        set_keystore("Assets\\Editor\\keystore\\testing.keystore", "testing", "testing", "testing");

        if (!string.IsNullOrEmpty(Environment.GetEnvironmentVariable("androidSdkPath")))
            EditorSetup.AndroidSdkRoot = Environment.GetEnvironmentVariable("androidSdkPath");

        Build(BuildTarget.Android);
    }

    public static void set_keystore(string path, string keystore_pass, string keyalias_name, string keyalias_pass)
    {
        PlayerSettings.Android.keystoreName = path;
        PlayerSettings.Android.keystorePass = keystore_pass;
        PlayerSettings.Android.keyaliasName = keyalias_name;
        PlayerSettings.Android.keyaliasPass = keyalias_pass;
    }

    public static void BuildiOS() {
        Build(BuildTarget.iOS);
    }

    public static void BuildOSX() {
        Build(BuildTarget.StandaloneOSXIntel64);
    }

    public static void BuildWindows() {
        Build(BuildTarget.StandaloneWindows);
    }

    public static void Build(BuildTarget target) {
		string[] levels = new string[1]{"Assets/main.unity"};
        
        string path = "C:/Users/Noam/Google Drive/Byondata/unity/vr-test-travis/Build/android.apk";
        if (!string.IsNullOrEmpty(Environment.GetEnvironmentVariable("buildpath")))
            EditorSetup.AndroidSdkRoot = Environment.GetEnvironmentVariable("buildpath");
            
        if (!Directory.Exists(Path.GetDirectoryName(path)))
            Directory.CreateDirectory(Path.GetDirectoryName(path));
        string err = BuildPipeline.BuildPlayer(levels, path, target, BuildOptions.None);
        if (!string.IsNullOrEmpty(err))
        {
            Debug.LogError(err);
            throw new System.Exception("Error in Building");
        }
    }
}

public class EditorSetup {
    public static string AndroidSdkRoot {
        get { return EditorPrefs.GetString("AndroidSdkRoot"); }
        set { EditorPrefs.SetString("AndroidSdkRoot", value); }
    }

    public static string JdkRoot {
        get { return EditorPrefs.GetString("JdkPath"); }
        set { EditorPrefs.SetString("JdkPath", value); }
    }

    // This requires Unity 5.3 or later
    public static string AndroidNdkRoot {
        get { return EditorPrefs.GetString("AndroidNdkRoot"); }
        set { EditorPrefs.SetString("AndroidNdkRoot", value); }
    }
}