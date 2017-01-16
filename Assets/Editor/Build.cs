using System;
using System.Linq;
using UnityEditor;

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
        BuildPipeline.BuildPlayer(levels.ToArray(), Environment.GetCommandLineArgs().Last(), target,
            BuildOptions.None);
    }
}