---
title: "AL Profiler Overview"
description: "Description of the AL profiler for Business Central."

author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 06/21/2021
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# AL Profiler Overview

With the AL Profiler for [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] you can capture a performance profile of the executed code for a snapshot. Using the performance profiling editor view in Visual Studio Code, you can investigate the time spent on execution, either using top-down and bottom-up call stack views, or flame graphs.

The AL profiler works on a snapshot of running code. For more information, see [Snapshot Debugging](devenv-snapshot-debugging.md).

## AL configuration 

The option for adding a lower limit for time spent on statement execution is `al.statementLensMin`. To activate this setting, press **Ctrl+Shift+P**, and then choose **Preferences: Open Settings (UI)** for workspace settings, or choose **Preferences: Open User Settings** for user settings. <!-- Setting..., which will be shown when opening a code file through the AL profiler`al.statementLensMin` -->


When the snapshot debugging session is saved, you can generate a snapshot profile

**AL: Generate profile file**

## Graph of method calls

![Graph of method calls](../media/profiler-graph.png)

### View modes

To switch between top-down and bottom-up views, use the small button in the upper right corner. 
When sorting the stack top down, the graph is sorted according to call sequence, which means that the child nodes are the methods called from the parent node. And when sorting bottom up, the graph is sorted as a reverse call-stack, which means that the child nodes are methods who called the parent node.

### Details



## See Also

[Snapshot Debugging](devenv-snapshot-debugging.md)  