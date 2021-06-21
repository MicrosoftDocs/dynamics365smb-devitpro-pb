---
title: "The AL Profiler"
description: "Description of the AL profiler for Business Central."

author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 06/21/2021
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# The AL Profiler

With the AL Profiler for [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] you can capture a performance profile of the executed code for a snapshot. Using the performance profiling editor view in Visual Studio Code, you can investigate the time spent on execution, either using top-down and bottom-up call stack views, or flame graphs.

The AL profiler works on a snapshot of running code. For more information, see [Snapshot Debugging](devenv-snapshot-debugging.md).


## AL configuration 

The option for adding a lower limit for time spent on statement execution is `al.statementLensMin`. To activate this setting, press **Ctrl+Shift+P**, and then choose **Preferences: Open Settings (UI)** for workspace settings, or choose **Preferences: Open User Settings** for user settings. <!-- Setting..., which will be shown when opening a code file through the AL profiler`al.statementLensMin` -->

## See Also

[Snapshot Debugging](devenv-snapshot-debugging.md)  