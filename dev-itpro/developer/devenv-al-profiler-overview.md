---
title: Analyze AL Performance with the AL Profiler
description: Use instrumentation or sampling with the AL Profiler to analyze AL execution, SQL activity, call stacks, and performance hot spots.
author: SusanneWindfeldPedersen
ms.date: 10/07/2026
ms.topic: overview
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# AL Profiler overview

[!INCLUDE[2021_releasewave2](../includes/2021_releasewave2.md)]

Sampling profiling was added in Business Central 2022 release wave 1.

The AL Profiler helps you analyze performance hot spots in [!INCLUDE [prod_short](includes/prod_short.md)] extensions by recording execution details from a snapshot of running code. It supports two complementary modes. *Instrumentation* records every executed frame and provides detailed timings and call counts. *Sampling* periodically captures the active stack and generally has lower profiling overhead, but its timings are estimates. Sampling also surfaces SQL call activity, including in-client profiling.

Use the profiler to validate optimizations, isolate slow pages or processes, distinguish AL execution time from SQL time, and compare alternative implementations. Profiles open in Visual Studio Code with top-down and bottom-up call stack views, filtering, and color coding by application layer. CodeLens can inline timing and hit data directly in source.

## When to use the AL Profiler

- When users report that specific pages or processes run slower than expected.
- When you're optimizing your extension before publishing it to Marketplace.
- When you want to validate performance improvements in your code.
- When you need to identify which parts of a complex process consume the most time.


## Basic workflow

1. Configure an instrumentation or sampling snapshot in `launch.json`.
2. Capture and download the snapshot.
3. Generate an `.alcpuprofile` file, or record one in the client.
4. Explore call graphs, timings, hit counts, and SQL calls available in sampling profiles.

Apply filters to focus on the most expensive methods. Use profiling early and iteratively to keep performance predictable.

## Snapshot of the running code

By using the AL Profiler for the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], you can capture a performance profile from a snapshot of running code. Instrumentation profiling provides more accurate and detailed results. Sampling profiling is less accurate but can reveal performance trends faster. In the Visual Studio Code performance profiling editor, use top-down and bottom-up call stack views to investigate execution time.

<!--
The AL profiler works on a snapshot of running code. Snapshot debugging is a recording of running code that allows for later offline inspection. To be able to snapshot debug, you must be a **delegated admin**. For more information, see [Snapshot Debugging](devenv-snapshot-debugging.md). -->

## Snapshot configuration settings

Before profiling code, configure and capture a snapshot in `launch.json`. The configuration depends on the profiling type. Learn more about snapshot configuration in [Snapshot debugging](devenv-snapshot-debugging.md) and [Launch JSON file](devenv-json-launch-file.md).

### To set up a snapshot configuration for instrumentation profiling

The `executionContext` parameter supports the following values. If you omit it, the default is `DebugAndProfile`.

|Option|Description|
|------|-----------|
|`Debug` | The snapshot session doesn't gather profile information.|
|`Profile` | The snapshot session gathers only profile information, ignores snappoints, and doesn't support debugging.|
|`DebugAndProfile` | The snapshot session supports both debugging and profiling. This value is the default.|

The `profilingType` must be set to `Instrumentation` as illustrated in the example below.

To use the snapshot for both debugging and profiling, configure `launch.json` as follows:

```json
"configurations": [ 
        {
            "name": "snapshotInitialize: Your own server",
            "type": "al",
            "userId": "555",
            "request": "snapshotInitialize",
            "environmentType": "OnPrem",
            "server": "http://localserver",
            "serverInstance": "BC200",
            "authentication": "Windows",
            "breakOnNext": "WebClient",
            "executionContext": "DebugAndProfile",
            "profilingType": "Instrumentation"
        }
```

### To set up a snapshot configuration for sampling profiling

For sampling profiling, set `profilingType` to `Sampling` and `executionContext` to `Profile` in `launch.json`. Sampling profiling doesn't support debugging. Use the following configuration:

```json
"configurations": [ 
        {
            "name": "Your own server",
            "type": "al",
            "userId": "555",
            "request": "snapshotInitialize",
            "environmentType": "OnPrem",
            "server": "http://localserver",
            "serverInstance": "BC200",
            "authentication": "Windows",
            "breakOnNext": "WebClient",
            "executionContext": "Profile",
            "profilingType": "Sampling",
            "profileSamplingInterval": 100
        }
```

Supported sampling intervals are 50, 100, and 150 milliseconds. The default is 100 milliseconds.

> [!INCLUDE [2025-releasewave2-later](../includes/2025-releasewave2-later.md)]

Starting with 2025 release wave 2, sampling profiling can track SQL calls in the web client's in-client profiler and in snapshots captured from Visual Studio Code. The in-client profiler automatically uses sampling. To track SQL calls in a Visual Studio Code snapshot, set `profilingType` to `Sampling` in `launch.json`.

The profile shows which SQL calls were made so you can determine whether slow performance is caused by AL code or by SQL. For scheduled profiles, the **Performance Profiles** data includes the sampling duration, activity duration, SQL-call duration, and number of SQL statements. When you drill into a specific profile, you can see the captured SQL calls. You can hover over them and copy the queries.

## Getting a snapshot file

After you define the configuration and set `executionContext` to `DebugAndProfile` or `Profile`, start a snapshot debugging session. Press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> and select **AL: Initialize Snapshot Debugging**, or press <kbd>F7</kbd>.

After initialization, the status bar displays the snapshot debugging session counter:

:::image type="content" source="media/SnapshotDebugger.png" alt-text="Visual Studio Code status bar showing the snapshot debugging session counter.":::

Press <kbd>Alt</kbd>+<kbd>F7</kbd> to finish the session. Visual Studio Code lists the active snapshot sessions. Select a session to close it on the server and download its snapshot file. Learn more about snapshot debugging in [Snapshot debugging](devenv-snapshot-debugging.md).

## Generating a profile file for instrumentation profiling

After downloading the snapshot file, generate a profile file in one of these ways:

1. Press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>, select **AL: Generate Profile File**, and then select a snapshot from the drop-down list.
1. Alternatively, in Visual Studio Code **Explorer**, right-click the snapshot file and select **Generate Profile File**.

AL profile files use the `.alcpuprofile` extension. When you open a profile file, it appears in the Visual Studio Code performance profiling editor.

### Graph of method calls

Open the generated profile file in the performance profiling editor. By default, the file opens in top-down view. Learn more about profile graph views in [View modes](#view-modes). You can also right-click a profile file and select **AL Profile Visualizer TopDown Graph** or **AL Profile Visualizer BottomUp Graph**. The editor resembles the following image:

:::image type="content" source="../media/profiler-graph.png" alt-text="AL Profiler graph showing method calls and timing information.":::

Use the available view modes to investigate the graph. Select a method to navigate to its code. The default color legend is as follows:

|Layer|Color|
|-----|-----|
|System Application|Green|
|Base Application|Magenta|
|Other extensions|Yellow|
|System|Blue|

Configure the color legend with `al.profilerColors`. Use `al.profilerColors.apps` to assign colors to named apps. Other extensions use the extension color, which is yellow by default. Learn more about profiler color configuration in [AL Language Extension Configuration](devenv-al-extension-configuration.md).

#### View modes

To switch between views, right-click the profile file and select a view, or use the button in the upper-right corner. The graph has two view modes: top-down and bottom-up.

In top-down view, child nodes are methods called by the parent method. In bottom-up view, child nodes are methods that called the parent method.

#### Details

The **Self Time** and **Total Time** columns are important indicators of where time is spent in the code. **Self Time** is the time spent in the method itself, excluding time spent in methods that it calls. **Total Time** is **Self Time** plus the time spent in methods that it calls. In bottom-up graphs, select the **Self Time** or **Total Time** heading to sort by that column. Select it again to reverse the sort direction.

For instrumentation profiles, the top-down view includes a **Hit count** column. The sampling top-down view doesn't show that column. Time spent is aggregated.

#### Filter

The nodes in the graph can be filtered. The syntax is as follows:

`@column name | <alias> <op> <value> where`<br>
`<column name> := [function, url, path, selfTime, totalTime, id, objectType, objectName, declaringApplication, isBuiltinCodeUnitCall, hitCount]`

##### Column name aliases

The aliases that are available for the column names are:

`<alias> := [f, u, p, s, t, id, ot, on, da, b, h]`<br>
`<op> := [numeric operators, boolean operators, string operators]`<br>
`numeric operators : [:, =, >, <, <=, >=, <>, !=]`<br>
`: := equal`<br>
`boolean operators : [:, =, <>, !=]`<br>
`string operators : [:, =, !=, <>, ~=]`<br>
`~= := <regex>`

###### Filter examples

|Expression|Result|
|----------|------|
|@t > 1000 | Shows all nodes in the graph where the total time is greater than 1 second. |
|@h > 20 | Shows all nodes in the graph where the hit count was larger than 20. |
|@da ~= ^Ba | Shows nodes whose declaring application starts with `Ba`.|

### Keyboard shortcuts for navigating the graph

The following table provides an overview of the shortcut key combinations that you can use when you're working in the graph of method calls.

|Keyboard Shortcut|Action|
|-----------------|------|
|<kbd>Enter</kbd> or <kbd>Space</kbd> | Expand or collapse the focused node. |
|<kbd>Left arrow</kbd> | Collapse a node. |
|<kbd>Right arrow</kbd> | Expand a node. |
|<kbd>Tab</kbd>, then <kbd>Enter</kbd> | Focus the source link and open it. |
|<kbd>Home</kbd> | Jump to the first node of the list.|
|<kbd>End</kbd> | Jump to the last node of the list.|
|<kbd>Down arrow</kbd> | Jump to the next node. |
|<kbd>Up arrow</kbd> | Jump to the previous node. |
|<kbd>-</kbd> (minus) | Collapse all nodes.|
|<kbd>*</kbd> (star) | Expand one level for all nodes. Consecutive keystrokes expand the graph to the next level.|

### Inline Profiler CodeLens for AL profiling results

The Profiler CodeLens for AL shows profile results. It displays execution time and hit count inline for profiled statements. Statements below the `al.statementLensMin` threshold aren't shown.

Enable general CodeLens support in the Visual Studio Code user or workspace settings by adding `"editor.codeLens": true`. To open the settings, press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> and select **Preferences: Open Settings (UI)** or **Preferences: Open User Settings**.

Add two settings for AL Profiler CodeLens. `"al.areProfileLensesSupported": true` enables CodeLens and defaults to `true`. `al.statementLensMin` sets the minimum execution time, in milliseconds, for displaying a lens. Its default value is `500`. Learn more about these settings in [AL Language Extension Configuration](devenv-al-extension-configuration.md).

> [!NOTE]
> Because of the aggregation of frames, there can be minor discrepancies between the information appearing in the CodeLens and in the profiler.

## Sampling profiling

Use sampling profiling for an initial analysis of AL code performance in Visual Studio Code. It captures the active AL stack frame at set intervals during an attached session. Sampling is less accurate than instrumentation, but it provides a faster, less noisy indication of an AL method's self-time.

The server applies the following restrictions to sampling profiling:

- A sampling session stops when it reaches the server's snapshot-debugger keep-alive interval. The default is one hour, but a profiling caller can supply a shorter limit.
- By default, the server stops sampling after the profile exceeds 10,000 cached sampled frame definitions. This limit is controlled by the internal `MaxNumberOfCachedProfileSamples` server setting.

### In-client performance profiling

In [!INCLUDE [prod_short](includes/prod_short.md)], you can use the **Performance Profiler** page to record a sampling profile of a process that seems slow. The profiler generates an `.alcpuprofile` file that you can download and share. You can open the file in another [!INCLUDE [prod_short](includes/prod_short.md)] Performance Profiler or in Visual Studio Code. Learn more about in-client profiling in [In-client Performance Profiler overview](../administration/performance-profiler-overview.md).

## Related information

[Snapshot debugging](devenv-snapshot-debugging.md)  
[AL Language extension configuration](devenv-al-extension-configuration.md)  
[In-client performance profiler overview](../administration/performance-profiler-overview.md)  
[JSON files](devenv-json-files.md)
