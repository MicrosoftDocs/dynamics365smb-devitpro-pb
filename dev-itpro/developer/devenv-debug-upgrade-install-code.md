---
title: Debug Upgrade and Install Code in AL
description: Debug AL install and upgrade codeunits by attaching to Business Central before you publish an extension from Visual Studio Code.
author: SusanneWindfeldPedersen
ms.date: 10/07/2026
ms.topic: how-to
ms.author: solsen
ms.reviewer: solsen
---

# Debug extension installation and upgrade

Use an attach debugging session to test and troubleshoot install and upgrade codeunits when an extension is installed or upgraded.

## Attach and debug

1. In Visual Studio Code, configure `launch.json` with `request` set to `attach`. Make sure that `useSystemSessionForDeployment` is `false`, which is the default. When it's `true`, install and upgrade codeunits run in a system session and can't be debugged.
1. Add breakpoints to the install or upgrade code that you want to debug.
1. Press <kbd>F5</kbd> to start the attach debugging session.
1. After the debugger attaches, press <kbd>Ctrl</kbd>+<kbd>F5</kbd> to run **Publish extension without building**.

If you don't increment the app version, the install codeunits run. If you increment the app version or set `forceUpgrade` to `true` in `launch.json`, the upgrade codeunits run.

Learn more about attach configurations in [Attach and debug next](devenv-attach-debug-next.md). Learn more about setting breakpoints in [Debugging in AL](devenv-debugging.md).

## Related information

[Debugging](devenv-debugging.md)  
[Snapshot Debugging](devenv-snapshot-debugging.md)  
[Attach and Debug Next](devenv-attach-debug-next.md)  
