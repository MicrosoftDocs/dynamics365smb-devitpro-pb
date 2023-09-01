---
title: "Attach and debug next"
description: "Attach to a session on a specified server and debug for Web API sessions."
ms.custom: na
ms.date: 02/28/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
---

# Attach and debug next

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

If you don't want to publish and invoke functionality to debug it, you can instead attach a session to a specified server, and await a process to trigger the breakpoint you've set. Then debugging starts when the code that the breakpoint is set on is hit. 

> [!NOTE]  
> To use the attach functionality, you must make sure that your app is published with <kbd>Ctrl</kbd>+<kbd>F5</kbd> first, or with <kbd>Alt</kbd>+<kbd>Ctrl</kbd>+<kbd>F5</kbd> for [RAD](devenv-rad-publishing.md) publishing, before you start the debugging session with <kbd>F5</kbd>. Creating a new server session from the client can be achieved for example by launching a new client session. Pressing <kbd>F5</kbd> (Refresh) in a browser may not create a new server session, because it is cached, but if a session is expired and refreshed that will create a new session.

> [!IMPORTANT]  
> Only the user who starts a Visual Studio Code attach session can issue the Web request on the server.

## Attach configuration

You can activate the attach functionality by creating a new configuration in the `launch.json` file. The configuration has two flavors; **Attach to the client on the cloud sandbox** and **Attach to the client on your server**. Use the first option to attach to a cloud session, and the second option to attach to a local server. For an overview of configuration options, see [Launch JSON file](devenv-json-launch-file.md).

> [!NOTE]  
> With [!INCLUDE [prod_short](includes/prod_short.md)] 2023 release wave 1, two new properties are added to the launch configuration: `sessionId` and `userId`, which allow attaching to an ongoing session and also debugging on behalf of another user.

In the attach configuration, the `breakOnNext` setting specifies the next client to break on when the debugging session starts and allows only one option. The available options are: `WebServiceClient`, `WebClient`, and `Background`. Two other important properties are `sessionId` and `userId`. `sessionId` specifies an ongoing session of the specified type in `breakOnNext`. This session should belong to the user in `userId` property if specified.

If `sessionId` isn't specified, but `userId` is, then the debugger will be attached to the next session of the type specified in `breakOnNext` for the given user.

> [!IMPORTANT]  
> In case of `userId` being a different user than the user logged into Visual Studio Code, then the user logged into Visual Studio Code must be part of **D365 ATTACH DEBUG** permission set.

The example below illustrates a configuration for a local server.

> [!NOTE]  
> The debugger is able to connect to *background sessions*, and not *background tasks*.

```json
...
{
            "name": "My attach to local server",
            "type": "al",
            "request": "attach",
            "server": "https://localhost",
            "serverInstance": "BC200",
            "authentication": "Windows",
            "breakOnError": true,
            "breakOnRecordWrite": false,
            "enableSqlInformationDebugger": true,
            "enableLongRunningSqlStatements": true,
            "longRunningSqlStatementsThreshold": 500,
            "numberOfSqlStatements": 10,
            "breakOnNext": "WebClient"
        }
...
```

## Attach support

The following configurations for attach are supported:

|Business Central |Web client    |Web service client |Background session|
|-----------------|--------------|-------------------|------------------|
|On-premises      | Supported    |     Supported     |   Supported      |
|Sandbox          | Supported    |     Supported     |   Supported      |

### To start an attach session

1. In Visual Studio Code, under **Run**, choose **Add configuration**.
2. Choose whether to attach to a cloud or a local session.  
The `launch.json` file is now populated with the correct attach configuration settings. If you've selected a local session, change the default settings to point to your local server in the `server` and `serverInstance` settings.
3. Set `breakOnNext` to specify the client type on which to break.
4. In your code, set at least one breakpoint using **Run** from the toolbar, choose **New breakpoint**, and then choose which type of breakpoint to add. 
You can always add more breakpoints while debugging. 
5. If your most recent app is not yet published, it's important to make sure you publish it slecting <kbd>Ctrl</kbd>+<kbd>F5</kbd> , alternatively <kbd>Alt</kbd>+<kbd>Ctrl</kbd>+<kbd>F5</kbd> for RAD publishing. Then, use <kbd>F5</kbd> to start the attach session.  
    > [!IMPORTANT]  
    > If you modify the app code during the debugging session, make sure to re-publish the app using <kbd>Ctrl</kbd>+<kbd>F5</kbd> .
6. After publishing the app, select <kbd>F5</kbd> to start a debugging session.  
    > [!NOTE]  
    > If you have more attach configuration settings, you must first select which configuration to start.
7. Debug and inspect the code. You can add more breakpoints while debugging.
8. Stop the attach debugging session by selecting **Detach** in the Visual Studio Code toolbar.


## See Also  

[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions in AL](devenv-dev-overview.md)  
[Debugging](devenv-debugging.md)  
[Snapshot Debugging](devenv-snapshot-debugging.md)  
[JSON Files](devenv-json-files.md)  
[EnableLongRunningSQLStatements Property](./properties/devenv-properties.md)  
[EnableSQLInformationDebugger Property](./properties/devenv-properties.md)  
[LongrunningSQLStatementsThreshold Property](./properties/devenv-properties.md)  
[NumberOfSQLStatements Property](./properties/devenv-properties.md)