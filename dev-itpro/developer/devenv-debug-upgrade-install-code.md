---
title: "Debug Upgrade and Install Code"
description: "Overview of debugging upgrade and install codeunits in AL for Business Central"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/01/2022
ms.reviewer: na
ms.topic: conceptual
ms.author: solsen
---

# Debug Upgrade and Install Code

To test and troubleshoot issues in install and upgrade code, it's important to ensure that these processes run smoothly when the app is installed for the first time or when it's upgraded. You can add breakpoints in the install or upgrade code, and then attach and trigger publishing of an extension to debug these scenarios.

## Attach and debug

1. In Visual Studio Code, ensure that you've a `launch.json` file with the `request` option set to `attach`. For more information, see [Attach and Debug Next](devenv-attach-debug-next.md).  
1. Add one or more breakpoints in the code that you want to debug. For more information, see [Debugging](devenv-debugging.md).  
    > [!NOTE]  
    > If you *don't* increment the version of the app, the install codeunits will be invoked. If you *do* increment the version of the app, or if you set the `forceUpgrade` flag to `true` in the `launch.json` file, the upgrade codeunits will be invoked.
1. Invoke the **AL: Publish extension without building** option in the **Show All Commands** menu by pressing **Ctrl+Shift+P**, or use **Ctrl+F5** to publish the app file and start the attach session.  

## See Also

[Debugging](devenv-debugging.md)  
[Snapshot Debugging](devenv-snapshot-debugging.md)  
[Attach and Debug Next](devenv-attach-debug-next.md)  