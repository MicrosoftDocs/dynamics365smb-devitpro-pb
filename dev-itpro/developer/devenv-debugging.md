---
title: "Debugging"
description: "Overview of debugging in AL"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 11/29/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 9cfc02d2-2211-466f-b5e9-8178bdc79311
ms.author: solsen
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Debugging
The process of finding and correcting errors is called *debugging*. With Visual Studio Code and the AL Language extension you get an integrated debugger to help you inspect your code to verify that your application can run as expected. You start a debugging session by pressing F5.  

> [!TIP]  
> For more information about Debugging in Visual Studio Code, see [Debugging](https://code.visualstudio.com/docs/editor/debugging).

> [!IMPORTANT]  
> To enable debugging the `NetFx40_LegacySecurityPolicy` setting in the Microsoft.Dynamics.Nav.Server.exe.config file must be set to **false**.
This requires a server restart.

There are a number of limitations to be aware of:

- "External code" can only be debugged if the code has the `ShowMyCode` flag set. For more information, see [Security Setting and IP Protection](devenv-security-settings-and-ip-protection.md). 
- Not all AL types yet show helpful debugging.
- The debugger launches a new client instance each time you press F5. If you close the debugging session, and then start a new session, this new session will rely on a new client instance. We recommend that you close the Web client instances when you close a debugging session.  
- And finally, using the debugger with the online sandbox signup and AAD authentication method is not yet supported.

> [!TIP]  
> To control table data synchronization between each debugging session, see [Retaining table data after publishing](devenv-retaining-data-after-publishing.md).  

## Breakpoints  
The basic concept in debugging is the *breakpoint*, which is a mark that you set on a statement. When the program flow reaches the breakpoint, the debugger stops execution until you instruct it to continue. Without any breakpoints, the code runs without interruption when the debugger is active. Set a breakpoint by using the Debug Menu in Visual Studio Code. 

## Debugging shortcuts

|Keystroke    |Action         |
|-------------|---------------|
|F5           |Start debugging|
|Ctrl+F5      |Start without debugging|
|Shift+F5     |Stop debugging|
|Ctrl+Shift+F5|Restart debugging|
|F10          |Step over|
|F11          |Step into|
|Shift+F11    |Step out|

For more shortcuts, see [Debugging](https://code.visualstudio.com/docs/editor/debugging).

## See Also  
[Developing Extensions](devenv-dev-overview.md)  

