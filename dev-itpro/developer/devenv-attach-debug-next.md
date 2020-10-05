---
title: "Attach and Debug Next"
description: "Attach to a session on a specified server and debug for Web API sessions."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Attach and Debug Next

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

If you do not want to publish and invoke functionality to debug it, you can instead attach a session to a specified server and await a process to trigger the breakpoint you have set. Then debugging starts when the code that the breakpoint is set on is hit. This is particularly useful for debugging Web API sessions. 

> [!NOTE]  
> To use the attach functionality, you must make sure that your app is published with **Ctrl+F5** first, or with **Alt+Ctrl+F5** for [RAD](devenv-rad-publishing.md) publishing, before you start the debugging session with **F5**. To debug using attach, you must make sure to debug on a *new* session. Creating a new server session from the client can be achieved for example by launching a new client session. Pressing **F5** (Refresh) in a browser may not create a new server session, because it is cached, but if a session is expired and refreshed that will create a new session.

> [!IMPORTANT]  
> Only the user who starts a Visual Studio Code attach session can issue the Web request on the server.

## Attach configuration

You activate the attach functionality by creating a new configuration in the `launch.json` file. The configuration has two flavors; **Attach to the next client on the cloud sandbox** and **Attach to the next client on your server**. Use the first option to attach to a cloud session, and the second option to attach to a local server. 

In the attach configuration, the `breakOnNext` setting specifies the next client to break on when the debugging session starts and allows only one option. The available options are: `WebServiceClient`, `WebClient`, and `Background`. The example below illustrates a configuration for a local server.

```
...
{
            "name": "My attach to local server",
            "type": "al",
            "request": "attach",
            "server": "https://localhost",
            "serverInstance": "BC160",
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
|Sandbox          |Not supported |     Supported     |  Not supported   |

### To start an attach session

1. In Visual Studio Code, under **Debug**, choose **Add configuration**.
2. Choose whether to attach to a cloud or a local session.  
The `launch.json` file is now populated with the correct attach configuration settings. If you selected a local session, change the default settings to point to your local server in the `server` and `serverInstance` settings.
3. Set `breakOnNext` to specify the client type on which to break.
4. In your code, set at least one breakpoint using **Debug** from the toolbar, choose **New breakpoint**, and then choose which type of breakpoint to add. 
You can always add more breakpoints while debugging. 
5. It is important to make sure to publish your app by pressing **Ctrl+F5**, alternatively **Alt+Ctrl+F5** for RAD publishing. Your app *will not be* published if you only press **F5**.  
    > [!IMPORTANT]  
    > If you modify the app code during the debugging session, make sure to re-publish the app using **Ctrl+F5**.
6. After publishing the app, press **F5** to start a debugging session.  
    > [!NOTE]  
    > If you have more attach configuration settings, you must first select which configuration to start.
7. Debug and inspect the code. You can add more breakpoints while debugging.
8. Stop the attach debugging session by selecting **Detach** in the Visual Studio Code toolbar.


## See Also  

[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions in AL](devenv-dev-overview.md)  
[JSON Files](devenv-json-files.md)  
[EnableLongRunningSQLStatements Property](properties/devenv-enablelongrunningsqlstatements-property.md)  
[EnableSQLInformationDebugger Property](properties/devenv-enablesqlinformationdebugger-property.md)  
[LongrunningSQLStatementsThreshold Property](properties/devenv-longrunningsqlstatementsthreshold-property.md)  
[NumberOfSQLStatements Property](properties/devenv-numberofsqlstatements-property.md)  