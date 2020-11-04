---
title: "Snapshot Debugging"
description: "Overview of how snapshot debugging allows recording running AL code for Business Central"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/21/2020
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Snapshot Debugging

[!INCLUDE[2020_releasewave2_preview](../includes/2020_releasewave2_preview.md)]

Snapshot debugging allows a delegated admin to record AL code that runs on the server, and once it has run, debug the recorded *snapshot* in Visual Studio Code. For a delegated admin to create and download a snapshot file that exists on the server on behalf of an end-user, the delegated admin must be part of the **D365 Snapshot Debug** permission group. For more information, see [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions). One of the advantages of snapshot debugging is that it provides the ability to inspect code execution and variables in the production environment in a cloud service, on a specified user session.

> [!IMPORTANT]  
> With this release snapshot debugging is enabled in *sandbox environments* only. Debugging in a production environment will be enabled with a later release. You can, however, use snapshot debugging in this release to attach to a specific user session, which is currently not possible with regular debugging.

Snapshot debugging introduces the concept of *snappoints*. A snappoint is a breakpoint in Visual Studio Code that is set when creating a snapshot, they do not, however, stop execution of code like when using regular debugging. Snappoints instruct execution to log the state at the breakpoint for later offline inspection. Snapshot debugging will record AL code as it runs on the server, but will only collect variable information on: 

- Snappoints  
- AL exceptions

> [!IMPORTANT]  
> To enable snapshot debugging it is very important that the symbols on the tenant match the symbols on the server. This is not automatically detected, and must be manually checked. In this release, you can ensure this by copying the specific sandbox and download symbols from that copy. Furthermore, any code that snappoints are set in, must have been deployed, otherwise debugging will not work.

## Snapshot debugging keyboard shortcuts

In the following sections you can read more about how to initialize, view the status, and finalize a snapshot debugging session. For these actions, the following keyboard shortcuts are useful to familiarize yourself with. For additional keyboard shortcuts, see [Keyboard Shortcuts](devenv-keyboard-shortcuts.md).

|Keyboard Shortcut|Action|
|-----------------|------|
|**F7**|Start a snapshot debugging session|
|**Shift+F7**|List all available snapshots|
|**Alt+F7**|Finish a snapshot debugging session|

## Initializing a snapshot debugging session

From Visual Studio Code, you start a snapshot by creating a snapshot configuration file. There are two template configurations for a snapshot, which are accessed by selecting **Add Configuration** in Visual Studio Code.

- AL: Initialize a snapshot debugging session locally
- AL: Initialize a snapshot debugging session on cloud

Choose whether to run the session on a cloud service or locally. The configuration file will now contain the following information: 

|Setting | Description |
|--------|-------------|
|`userId`| The GUID of the user on whose behalf a snapshot debugging will be started. For on-premises, this can also be the user name in user password authentication scenarios. The user must be able to start, or have a session type opened that is specified in the `breakOnNext` parameter. For more information, see [JSON Files](devenv-json-files.md).|
|`sessionId`| A session ID for the user specified above in `userId`.|
|`snapshotVerbosity`| Determines how much execution context to be recorded. If **SnapPoint** is specified, then only methods that hit a snappoint will be recorded.|

When a configuration is defined, a snapshot debugging session can be initialized by pressing **Ctrl+Shift+P** and then selecting **AL:Initialize Snapshot Debugging** or by pressing **F7**.

To record the AL execution, the server will now wait for a connection to happen where the following rules apply: 

- If a `sessionId` is specified for a userId for a given tenant then it will be that session that will be snapshot debugged.
- If only a `userId` is specified for a given tenant then the next session that is specified in the `breakOnNext` configuration parameter is snapshot debugged. 
- If no `userId` is specified then the next session on a given tenant that validates the `breakOnNext` parameter will be snapshot debugged. 

Once a snapshot debugging session is initialized the snapshot debugging session counter on the status-bar will be updated and look like this:

![Snapshot Debugger Counter](media/snapshotdebugger.png)

## Status of a snapshot debugging session

Clicking on the status bar icon or pressing **Shift+F7**  will bring up a list of all available snapshots.  
The status list will show the state of a snapshot-debugged session. 

A snapshot debugging session can be in one of the three states:

- **Initialized** - A request is issued and the server is waiting for the next session to be snapshot debugged based on the above rules. 
- **Started** - You have attached to an end-user session to snapshot debug. 
- **Finished** - When the snapshot debugging session has finished. 
- **Downloaded** - When the snapshot file is downloaded. 

## Finishing a snapshot debugging session

You finish a snapshot debugging session by pressing **Alt+F7**. This brings up all snapshot sessions that have been started. Choosing one will close the session debugging on the server and download the snapshot file. 

> [!IMPORTANT]  
> The snapshot file can contain customer privacy data and must therefore be handled according to privacy compliance and should be deleted when it is not needed anymore.

Snapshot debugging sessions that have produced a snapshot file can be debugged. The location of a snapshot file is controlled by the `al.snapshotOutputPath` configuration parameter. By default it is local to the current workspace and it is called `./.snapshots`. For more information, see [AL Language Extension Configuration](devenv-al-extension-configuration.md).

## Debugging a snapshot file 

There are two user actions that will start snapshot debugging:

- Creating a new launch debug configuration and specifying the snapshot file name in the `snapshotFileName` configuration setting. This is the only setting that is needed besides the type, request, and name. 
- Clicking on the status icon or by pressing **Shift+F7** and selecting a finished snapshot-debugged session. 

Once a snapshot debugging session starts in Visual Studio Code, code execution will stop at the first snappoint. AL exceptions will be treated as snappoints, with the only difference that they cannot be removed by user actions. Other snappoints are just regular breakpoints that can be removed or re-added by user actions. If no snappoints are specified the first recorded methods; the first line is the entry breakpoint. 

The user can set breakpoints and continue execution to that breakpoint for testing, for example, if a line is hit, but it is the snappoint that carries the real information.

## Downloading symbols on the snapshot debugger endpoint

In order to download symbols on a production server, you need three permission related entries.

- Be a delegated admin
- Have snapshot debugger rights (D365 Snapshot Debug permission group)
- The read-only access to the **Published Application** table emphasized in the **D365 EXTENSION MGT** permission set should also be granted.

Debugging requires that symbols on the server are matched with the symbols that the user has locally. If this is not the case, and you set a breakpoint on a given line in Visual Studio Code, the line of code may differ from what is on the server.

## Snapshot debugging versus regular debugging

Snapshot debugging is almost the same as a regular debugging with the differences mentioned in the following:

|Snapshot versus regular debugging|
|--|
|Breakpoints can be added and removed and they will be hit if given a breakpoint; the breakpoint is in the execution context of a recorded state. This means that if walking the execution stack for a breakpoint and the next stepped line is reached, then the code will break on the breakpoint. |
|A snappoint is a breakpoint in Visual Studio Code that is set when creating a snapshot, they do not, however, stop execution of code like when using regular debugging. Snappoints instruct execution to log the state at the breakpoint for later offline inspection.|
|You can always navigate through all the breakpoints with **Continue** (F5). The order may not be the same as the execution order on the Business Central server. This is due to the fact that some calls on the server are AL calls with non-walkable stacks. Some are direct server calls on the server like triggers. A snapshot debugging session on the Business Central server can only record AL calls and walk AL stack traces.|
|This is also true when stepping. The rule of thumb is that breakpoints within the reach are hit first, and if there are none; the next line is hit. Breakpoints on triggers may not always qualify as code within reach.|
|Variable data is only shown on snappoints.|
|If there are no frames available snapshot debugging will stop.|
|Stepping out of triggers with no recorded stack information will move execution to the first recorded method's first line. This may be very far from the user's execution of interest. For example, stepping out from an `OnOpenPage` trigger with a snappoint may land on deep inside base code execution where recording has started. Navigating with **F5** will start over breakpoint resolution, thus this is an exit strategy from a scenario like this.|
|A snappoint may resolve as a non-reachable breakpoint if there was no execution state on the server hitting the snappoint.|
|A snapshot debugger session with a Business Central server will be closed if not attached to after 30 minutes.|
|If a snapshot debugger session is started, it has to be finished after 10 minutes.|

<!-- Getting variables is expensive.-->
<!-- We may also enable a server settings (not in effect now, but we may for the Prod) that may not collect variable information on snap points if the resource consumption on the server (SAAS scenario) is within certain (we determine it) thresholds. I do not know how to put this "nicely", but basically we can anytime disable to get variable information for sessions that behave like "elephants in a china shop" -->
 
## See Also

[Debugging](devenv-debugging.md)  
[Attach and Debug Next](devenv-attach-debug-next.md)  
[Developing Extensions](devenv-dev-overview.md)  
[JSON Files](devenv-json-files.md)  
[AL Code Navigation](devenv-al-code-navigation.md)  
[EnableLongRunningSQLStatements Property](properties/devenv-enablelongrunningsqlstatements-property.md)  
[EnableSQLInformationDebugger Property](properties/devenv-enablesqlinformationdebugger-property.md)  
[LongrunningSQLStatementsThreshold Property](properties/devenv-longrunningsqlstatementsthreshold-property.md)  
[NumberOfSQLStatements Property](properties/devenv-numberofsqlstatements-property.md)  
