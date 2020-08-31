---
title: "Snapshot Debugging"
description: "Overview of how snapshot debugging works in AL for Business Central"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/31/2020
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Snapshot Debugging

Snapshot debugging allows a delegated admin to record AL code that runs on the server, and once it has run, debug the recorded *snapshot* in Visual Studio Code. For a delegated admin to create and download a snapshot file that exists on the server on behalf of an end-user, the delegated admin must be part of the **D365 Snapshot Debug** permission group.  

Snapshot debugging introduces the concept of snappoints. A snappoint is a breakpoint in Visual Studio Code that is set when creating a snapshot. Snapshot debugging will record AL code as it runs on the server, but will only collect variable information on: 

- Snappoints 
- AL exceptions


## See Also

[Attach and Debug Next](devenv-attach-debug-next.md)  
[Developing Extensions](devenv-dev-overview.md)  
[JSON Files](devenv-json-files.md)  
[AL Code Navigation](devenv-al-code-navigation.md)  
[EnableLongRunningSQLStatements Property](properties/devenv-enablelongrunningsqlstatements-property.md)  
[EnableSQLInformationDebugger Property](properties/devenv-enablesqlinformationdebugger-property.md)  
[LongrunningSQLStatementsThreshold Property](properties/devenv-longrunningsqlstatementsthreshold-property.md)  
[NumberOfSQLStatements Property](properties/devenv-numberofsqlstatements-property.md)  
