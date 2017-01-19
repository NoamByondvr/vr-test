using System;
using System.Linq;
using System.IO;
using UnityEditor;
using UnityEngine;

public class BuildMyGame {

    public static void BuildAndroid() {
        PlayerSettings.Android.minSdkVersion = AndroidSdkVersions.AndroidApiLevel19;
        PlayerSettings.bundleIdentifier = "com.ccccc.ppppp";
        //EditorSetup.AndroidSdkRoot = Environment.GetEnvironmentVariable("androidSdkPath");
        Build(BuildTarget.Android);
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
        string path = Environment.GetCommandLineArgs().Last();
        if (!Directory.Exists(Path.GetDirectoryName(path)))
            Directory.CreateDirectory(Path.GetDirectoryName(path));
        string err = BuildPipeline.BuildPlayer(levels.ToArray(), path, target, BuildOptions.None);
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