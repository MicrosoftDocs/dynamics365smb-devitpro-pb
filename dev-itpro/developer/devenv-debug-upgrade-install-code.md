---
title: "Debugging Upgrade and Install Code"
description: "Overview of debugging upgrade and install codeunits in AL for Business Central"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 05/18/2022
ms.reviewer: na
ms.topic: conceptual
ms.author: solsen
---

# Debugging Upgrade and Install Code

Testing and troubleshooting issues on install and upgrade code is important to ensure that these processes run smoothly when the app is installed for the first time or when it's upgraded. You can add breakpoints in the install or upgrade code, and then attach and trigger publishing of an extension to debug these scenarios.

## Attach and debug

1. From Visual Studio Code, adding one or more breakpoints in the code that you want to debug. 
1. Start an attach debug session. For more information, see [Attach and Debug Next](devenv-attach-debug-next.md).
1. When the debugger has attached, select the **AL: Publish extension without building** option in the **Show All Commands** menu by pressing **Ctrl+Shift+P**.  
    > [!NOTE]  
    > The **AL: Publish extension without building** option is only available if the `request` option in the `launch.json` file is set to `attach`.
1. Now, invoke the **AL: Publish extension without building** command or use **Ctrl+F5** to publish the app file.  

If the version of the app *hasn't* been incremented, the install codeunits will be invoked. If the version of the app *has* been incremented, or if the `forceUpgrade` flag has been set to `true` in the `launch.json` file, the upgrade codeunits will be invoked.

## See Also

[Debugging](devenv-debugging.md)  
[Snapshot Debugging](devenv-snapshot-debugging.md)  
[Attach and Debug Next](devenv-attach-debug-next.md)  