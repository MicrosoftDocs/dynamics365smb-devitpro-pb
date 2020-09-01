---
title: "Snapshot Debugging"
description: "Overview of how snapshot debugging works in AL for Business Central"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/31/2020
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Snapshot Debugging

Snapshot debugging allows a delegated admin to record AL code that runs on the server, and once it has run, debug the recorded *snapshot* in Visual Studio Code. For a delegated admin to create and download a snapshot file that exists on the server on behalf of an end-user, the delegated admin must be part of the **D365 Snapshot Debug** permission group.

Snapshot debugging introduces the concept of *snappoints*. A snappoint is a breakpoint in Visual Studio Code that is set when creating a snapshot. Snapshot debugging will record AL code as it runs on the server, but will only collect variable information on: 

- Snappoints 
- AL exceptions

## Initializing a snapshot debugging session

From Visual Studio Code, you start a snapshot by creating a snapshot configuration file. There are two template configurations for a snapshot, which are accessed by selecting **Add Configuration** in Visual Studio Code.

- AL: Initialize a snapshot debugging session locally 
- AL: Initialize a snapshot debugging session on cloud 

Choose whether to run the session on a cloud service or locally. The configuration file will now contain the following information: 

|Setting | Description |
|--------|-------------|
|`userId`| The GUID of the user on whose behalf a snapshot debugging will be started. For on-premises, this can also be the user name in user password authentication scenarios. The user must be able to start, or have a session type opened that is specified in the `breakOnNext` parameter. |
|`sessionId`| A session ID for the user specified above in `userId`.|
|`snapshotVerbosity`| Determines how much execution context to be recorded. If only **"SnapPoint** is specified then only methods that hit a snappoint will be recorded.|

When a configuration is defined, a snapshot debugging session can be initialized by pressing **Ctrl+Shift+P** and then selecting **AL:Initialize Snapshot Debugging** or by pressing **F4**. 

To record the AL execution, the server will now wait for a connection to happen with the following rules: 

- If a `sessionId` is specified for a userId for a given tenant then it will be that session that will be snapshot debugged.
- If only a `userId` is specified for a given tenant then the next session that is specified in the `breakOnNext` configuration parameter is snapshot debugged. 
- If no `userId` is specified then the next session on a given tenant that validates the `breakOnNext` parameter will be snapshot debugged. 

Once a snapshot debugging session is initialized the snapshot debugging session counter on the status-bar will be updated and look like this:

![Snapshot Debugger](media/snapshotdebugger.png)

## Status of a snapshot debugging session

Clicking on the status bar icon or pressing **Shift+F4**  will bring up a list of all available snapshots.  
The status list will show the state of a snapshot-debugged session. 

A snapshot debugging session can be in one of the three states:

- **Initialized** - the server is waiting for the next session to be snapshot debugged based on the above rules. 
- **Started** - an end-user has connected with a session that is snapshot debugged. 
- **Finished** - snapshot debugging has finished. 

## Finishing a snapshot debugging session

You finish a snapshot debugging session by pressing **Alt+F4**. This brings up all snapshot sessions that have been started. Choosing one will close the session debugging on the server and download the snapshot file. 

> [!IMPORTANT]  
> The snapshot file can contain customer privacy data and must therefore be handled according to privacy compliance and should be deleted when it is not needed anymore.

Snapshot debugging sessions that have produced a snapshot file can be debugged. The location of a snapshot file is controlled by the `al.snapshotOutputPath` configuration parameter. By default it is local to the current workspace and it is called `./.snapshots`. For more information, see [AL Language Extension Configuration](devenv-al-extension-configuration.md).

## Debugging a snapshot file 

There are two user actions that will start snapshot debugging:

- Creating a new launch debug configuration and specifying the snapshot file name in the `snapshotFileName` configuration setting. This is the only setting that is needed besides the type, request, and name. 
- Clicking on the status icon or by pressing **Shift+F4** and selecting a finished snapshot-debugged session. 

Once a snapshot debugging session starts in Visual Studio Code, code execution will stop at the first snappoint. AL exceptions will be treated as snappoints, with the only difference that they cannot be removed by user actions. Other snappoints are just regular breakpoints that can be removed/re-added by user actions. If no snappoints are specified the first recorded methods; the first line is the entry breakpoint. 

The user can set breakpoints and continue execution to that breakpoint for testing, for example, if a line is hit, but it is the snappoint that carries the real information.

## Snapshot debugging versus regular debugging

Snapshot debugging is almost the same as a regular debugging with a few differences:

- Breakpoints can be added and removed and they will be hit if given a breakpoint; the breakpoint is in the execution context of a recorded state. This means that if walking the execution stack for a breakpoint the next stepped line is reached, then the code will break on the breakpoint. 
- You can always navigate through all the breakpoints with **Continue** (F5). The order may not be the same as the execution order on the [!INCLUDE[prodshort](includes/prodshort.md)] server. This is due to the fact that some calls on a [!INCLUDE[prodshort](includes/prodshort.md)] server are AL calls with non-walkable stacks. Some are direct server calls on the server like triggers. A snapshot debugging session on the [!INCLUDE[prodshort](includes/prodshort.md)] server can only record AL calls and walk AL stack traces. 
- This is also true when stepping. The rule of thumb is that breakpoints within the reach are hit first, and if there are none; the next line is hit. Breakpoints on triggers may not always qualify as code within reach. 
- Variable data is only shown on snappoints. 
- If there are no frames available snapshot debugging will stop.
- Stepping out of triggers with no recorded stack information will move execution to the first recorded method's first line. This may be very far from the user's execution of interest. For example, stepping out from an `OnOpenPage` trigger with a snappoint may land on deep inside base code execution where recording has started. Navigating with **F5** will start over breakpoint resolution, thus this is an exit strategy from a scenario like this. 
- A snappoint may resolve as a non-reachable breakpoint if there was no execution state on the server hitting the snappoint.  
 
## See Also

[Attach and Debug Next](devenv-attach-debug-next.md)  
[Developing Extensions](devenv-dev-overview.md)  
[JSON Files](devenv-json-files.md)  
[AL Code Navigation](devenv-al-code-navigation.md)  
[EnableLongRunningSQLStatements Property](properties/devenv-enablelongrunningsqlstatements-property.md)  
[EnableSQLInformationDebugger Property](properties/devenv-enablesqlinformationdebugger-property.md)  
[LongrunningSQLStatementsThreshold Property](properties/devenv-longrunningsqlstatementsthreshold-property.md)  
[NumberOfSQLStatements Property](properties/devenv-numberofsqlstatements-property.md)  
