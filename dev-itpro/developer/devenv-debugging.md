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
The process of finding and correcting errors is called *debugging*. With Visual Studio Code and the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] you get an integrated debugger to help you inspect your code to verify that your application can run as expected. You start a debugging session by pressing F5.  

> [!TIP]  
> For more information about Debugging in Visual Studio Code, see [Debugging](https://code.visualstudio.com/docs/editor/debugging).

> [!IMPORTANT]  
> To enable debugging the `NetFx40_LegacySecurityPolicy` setting in the Microsoft.Dynamics.Nav.Server.exe.config file must be set to **false**.
This requires a server restart.

There are a number of limitations to be aware of:

- "External code" can only be debugged if the code has the `showMyCode` flag set. For more information, see [Security Setting and IP Protection](devenv-security-settings-and-ip-protection.md). 
- Not all AL types yet show helpful debugging.
- The debugger launches a new client instance each time you press F5. If you close the debugging session, and then start a new session, this new session will rely on a new client instance. We recommend that you close the Web client instances when you close a debugging session.  
- And finally, using the debugger with the online sandbox signup and AAD authentication method is not yet supported.

> [!TIP]  
> To control table data synchronization between each debugging session, see [Retaining table data after publishing](devenv-retaining-data-after-publishing.md).  

## Breakpoints  
The basic concept in debugging is the *breakpoint*, which is a mark that you set on a statement. When the program flow reaches the breakpoint, the debugger stops execution until you instruct it to continue. Without any breakpoints, the code runs without interruption when the debugger is active. Set a breakpoint by using the Debug Menu in Visual Studio Code. 

### Debugging shortcuts

|Keystroke    |Action         |
|-------------|---------------|
|F5           |Start debugging|
|Ctrl+F5      |Start without debugging|
|Shift+F5     |Stop debugging|
|Ctrl+Shift+F5|Restart debugging|
|F10          |Step over|
|F11          |Step into|
|Shift+F11    |Step out|
|F12          |Go To Definition| 

For more shortcuts, see [Debugging](https://code.visualstudio.com/docs/editor/debugging). 

> [!TIP]  
> You can refresh the debug session by using the Ctrl + Shift + P and select Reload Window.

## Go To Definition 
The Go To Definition feature navigates to the source of a type and opens the result in a new tab. You can use the `F12` shortcut key or right click and select the Go To Definition feature. The Go To Definition opens the source in the `.dal` format which contains the base app code including metadata and application methods. You can use the Go To Definition feature if the base app was originally set with the `showMyCode` property to **true**. 

![F12](media/DebuggingAL.gif)

## Break on Errors
You can specify if the debugger breaks on the next error by using the `breakOnError` property. If the debugger is set to break on errors, then it breaks execution both on errors that are handled in code and on unhandled errors. The default value of the `breakOnError` property is **true**, which means the debugger is set to break on errors by default. However, to skip error handling, you can set the `breakOnError` property to **false** in the `launch.json` file. For more information, see [JSON Files](devenv-json-files.md).

## Break on Record changes
You can specify if the debugger breaks on record changes by using the `breakOnRecordWrite` property. If the debugger is set to break on record changes, then it breaks before creating, modifying, or deleting a record. The following table shows each record change and the AL methods that cause each change.  

|Record change|AL Methods|  
|-------------------|---------------------|  
|Create a new record|[INSERT Method \(Record\)](methods/devenv-insert-method-record.md)|  
|Update an existing record|[MODIFY Method \(Record\)](methods/devenv-modify-method-record.md), [MODIFYALL Method \(Record\)](methods/devenv-modifyall-method-record.md), [RENAME Method \(Record\)](methods/devenv-rename-method-record.md)|  
|Delete an existing record|[DELETE Method \(Record\)](methods/devenv-delete-method-record.md), [DELETEALL Method \(Record\)](methods/devenv-deleteall-method-record.md)|  


The default value of the `breakOnRecordWrite` property is **false**, which means the debugger is not set to break on record changes by default. To break on record changes, you can set the `breakOnRecordWrite` property to **true** in the `launch.json` file. 

<!-- 
To use the Go To Definition on local server, it requires that the AL symbols are rebuilt and downloaded from C/SIDE. The application symbols that were built with the previous version of C/SIDE would not make it possible to have Go To Definition work on base application methods. -->

## See Also  
[Developing Extensions](devenv-dev-overview.md)  
[JSON Files](devenv-json-files.md)  


