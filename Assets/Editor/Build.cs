using System;
using System.Linq;
using System.IO;
using UnityEditor;
using UnityEngine;

public class BuildMyGame {

    public static void BuildAndroid() {
        Build(BuildTarget.Android);
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