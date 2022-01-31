---
title: "AL Language Extension Configuration"
description: "Description of the settings of the AL Language extension in Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 12/10/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# AL Language Extension Configuration

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

The AL Language extension has a number of settings that can be specified for a specific user or for a workspace. To activate the settings, press **Ctrl+Shift+P**, and then choose **Preferences: Open Settings (UI)** for workspace settings, or choose **Preferences: Open User Settings** for user settings. Under **Extensions**, and **AL Language extension configuration** you will find the settings that are available for the AL Language extension. For tips on how to optimize Visual Studio Code, see [Optimizing Visual Studio Code for AL Development](devenv-optimize-visual-studio-code.md).

## Settings
The following table describes the user and workspace settings for the AL Language extension:

|Setting|Value|
|-------|-----|
|Assembly Probing Paths|Sets the list of directory paths where the compiler searches for referenced .NET assemblies. For example: `"al.assemblyProbingPaths": ["./.netpackages", "C:/Program Files/Assemblies"]`|
|Are Profile Lenses Supported| Enables the Profiler CodeLens for AL, default value is `true`. Syntax is `"al.areProfileLensesSupported": true`. For more information, see [AL Profiler Overview](devenv-al-profiler-overview.md).|
|Browser|Specifies the browser in which to open the Business Central client when launching the application from Visual Studio Code.|
|Background Code Analysis|Specifies whether the code analysis should be performed in the background.|
|Code Analyzers|Sets the list of paths to code analyzers to use for performing code analysis. For example: `"al.codeAnalyzers": ["${AppSourceCop}", "${CodeCop}"]`.|
|Compilation Options|Specifies the compilation options;  <br>`continueBuildOnError` - specifies if build should continue even if errors are found. The default and recommended value from a performance point of view is `false`. Set the value to `true` to continue building the project, even if errors are found.  It requires `al.incrementalBuild` to be `false`. <br>`delayAfterLastDocumentChange` - specifies the number of milliseconds to wait after the last buffer changes before getting document diagnostics. After changing the value of this option, you must restart Visual Studio Code for it to take effect. Default value is `800`. <br> `delayAfterLastProjectChange` - specifies the number of milliseconds to wait after the last buffer changes before getting complete diagnostics. After changing the value of this option, you must restart Visual Studio Code for it to take effect. Default value is `4000`.  <br> `maxDegreeOfParallelism` - specifies the maximum number of concurrent tasks the compiler should use when compiling the project. Default value is `2`. <br> `parallel` - controls whether to use concurrent builds. Default value is `true`.  <br>`generateReportLayout`- controls whether the compiler will generate Report Layout files when building the package. Default value is `true`.|
|Editor Services Log Level|Sets the logging verbosity level for the AL Language Editor Services host executable. Possible values are `Verbose`, `Normal`, `Warning`, and `Error`.|
|Editor Services Path|Specifies the path to the Editor Services host executable.|
|Enable Code Actions|Specifies whether code actions should be enabled for all source files in the current project. Default is `false`.|
|Enable Code Analysis|Specifies whether code analysis should be performed for all source files in the current project. Default is `false`. If this is set to `true`, you must specify the **Code Analyzers** setting with the list of code analyzers to use.|
|Enable Script IntelliSense|Specifies whether IntelliSense should be enabled for control add-in script files. Turn this off if it interferes with advanced JavaScript or TypeScript configurations. Default is `true`.|
|Incognito|Specifies whether to open the browser in Incognito/InPrivate mode when launching the application from Visual Studio Code. This option will take effect only if the **Browser** option is set to a non-default value.|
|Incremental Build| Specifies whether a project, when it is built using **Ctrl+Shift+B**, **Ctrl+F5**, or **F5**, will reuse the last known tracked compilation which will enhance the compilation time significantly. For more information about project to project references, see [Working with multiple projects and project references](devenv-work-workspace-projects-references.md). <br> **Note:** Setting this to `true` will not do an end-to-end build, as it is depending on an already-compiled state. To get a clean, full build, this flag must be set to `false`. Default is `false`. <br> **Important:** If this setting is enabled then all translations will be ignored, even though the `"features": [ "TranslationFile" ]` setting is specified in the `app.json` file. For more information, see [Working with Translation Files](devenv-work-with-translation-files.md).|
|Package Cache Path|Sets the directory path where reference symbol packages are located.|
|Profiler Colors|Specifies the colors used to define the application types in the profiler output. Accepts valid color names, hex codes, and rgba() values. The properties are `systemApplication` - default color `green`, `baseApplication` - default color `magenta`, and `extension` - default color `yellow`.|
|Rule Set Path|Sets the path to the file containing the customized rules to use when running code analysis.|
|Snapshot Debugging Path|Sets the directory path where the snapshot debugger sources are located. Default is `./.snapshot`.|
|Snapshot Output Path|Sets the directory path where snapshot files are saved. Default is `./.snapshots`.|
|Statement Lens Minimum|Sets the lower limit for time spent on statement execution expressed in milliseconds. Default value is `500`. Syntax is `"al.statementLensMin": 100`. For more information, see [AL Profiler Overview](devenv-al-profiler-overview.md).|
|Use Legacy Runtime|Use the .NET Framework runtime for hosting the language service instead of the .NET Core runtime. Enabling this might result in a reduced level of performance.|

## See Also

[AL Development Reference](devenv-reference-overview.md)  
[Debugging in AL](devenv-debugging.md)  
[JSON Files](devenv-json-files.md)  
[Working with multiple projects and project references](devenv-work-workspace-projects-references.md)  
