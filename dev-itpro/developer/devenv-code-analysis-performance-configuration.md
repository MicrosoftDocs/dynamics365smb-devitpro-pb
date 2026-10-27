---
title: AL Code Analysis Performance Configuration
description: Configure background code analysis in AL for Business Central, identify slow analyzers, and adjust the analysis scope to improve editor performance.
author: BazookaMusic
ms.author: sodragon
ms.reviewer: solsen
ms.topic: how-to
ms.date: 10/21/2026
ms.custom: bap-template
---

# Code analysis performance configuration

[!INCLUDE [2023_releasewave1](../includes/2023_releasewave1.md)]

Configure background code analysis to reduce its impact on editor performance in AL for Business Central. You can adjust the analysis scope and use build statistics to identify long-running analyzers.

These settings apply when [code analysis is enabled](devenv-using-code-analysis-tool.md) and analyzers are configured for your project.

## Open the AL extension settings

1. Open the Command Palette with <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>, and select **Preferences: Open Settings (UI)**.
2. Select the **User** or **Workspace** tab for the scope you want to configure.
3. Go to **Extensions** > **AL Language extension configuration**.

You can also edit the settings directly in `settings.json`. You can configure them at user, workspace, or workspace-folder scope. Folder settings override workspace settings, and workspace settings override user settings.

## Configure the background analysis scope

When you edit a project with code analysis enabled, changes schedule background recalculation of diagnostics. Use `al.backgroundCodeAnalysis` to control the scope.

| Value | Background analysis behavior |
|---|---|
| `File` | The default. The extension adapts analysis to workspace and project size. Smaller projects can receive project-wide analysis, including directly dependent projects. For larger projects, file-level analyzer diagnostics are calculated for the active file. |
| `Project` | Runs analyzers across the entire project. This behavior can increase CPU usage and the time needed to refresh diagnostics. |
| `None` | Disables background execution of code analyzers. Enabled analyzers still run during a full build, subject to the project's ruleset. |

With `File`, file-level analyzer diagnostics for inactive files in larger projects might not be refreshed until you open those files. Project-level analyzer diagnostics can still be reported.

Setting the scope to `None` doesn't disable ordinary compiler diagnostics.

## Identify long-running analyzers

Set `al.outputAnalyzerStatistics` to `true`, and then build the project. The build output includes execution times and percentages for the analyzers that ran, together with their supported diagnostic IDs.

The following example shows illustrative analyzer statistics. Percentages are based on total analyzer execution time, not total build time.

```text
Time (s)    %   Analyzer (Related Diagnostics)
   0.092   73   CodeCop
   0.032   24      Application Area Has Invalid Value (AA0189, AA0199, AA0200, AA0201)
   0.028   22      Rec Db Invocation Analyzer (AA0181, AA0233)
   0.028   22      Do Not Declare Variables That Are Unused (AA0137)
   0.001   <1      Variables Names Analyzer (AA0073, AA0237, AA0072)
  <0.001   <1      Use Lowercase For Language Keywords (AA0241)
  <0.001   <1      Email And Phone No Must Not Be Present In The Source (AA0240)
  ...
```

## Disable selected analyzers with a ruleset

To prevent a long-running analyzer from running, add an entry in the project's [ruleset](devenv-rule-set-syntax-for-code-analysis-tools.md) for every diagnostic ID listed for that analyzer. Set each entry's `action` property to `None`. Suppressing only some of its diagnostics might not prevent the analyzer from running.

These ruleset settings also apply during full builds. Review which checks your project requires before disabling diagnostics.

## Related information

[Using the code analysis tools](devenv-using-code-analysis-tool.md)  
[Using the code analysis tools with the ruleset](devenv-using-code-analysis-tool-with-rule-set.md)  
[Ruleset for the code analysis tool](devenv-rule-set-syntax-for-code-analysis-tools.md)  
[AL Language extension configuration](devenv-al-extension-configuration.md)  
