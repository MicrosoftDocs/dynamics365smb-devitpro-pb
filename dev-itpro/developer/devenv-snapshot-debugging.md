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

Snapshot debugging introduces the concept of *snappoints*. A snappoint is a breakpoint in Visual Studio Code that is set when creating a snapshot. Snapshot debugging will record AL code as it runs on the server, but will only collect variable information on: 

- Snappoints 
- AL exceptions

## Initializing a snapshot debugging session

From Visual Studio Code, you start a snapshot by creating a snapshot configuration file. There are two template configurations for a snapshot, which are accessed by selecting **Add Configuration** in Visual Studio Code.

- AL: Initialize a snapshot debugging session on cloud 
- AL: Initialize a snapshot debugging session locally 

Choose whether to run the session on a cloud service or locally. The configuration file will now contain the following information:

New snapshot debugging configuration data: 

|Setting | Description |
|--------|-------------|
|userId| The GUID of the user on whose behalf a snapshot debugging will be started. This can be the user name too in on user password authentication scenarios. The user must be able to start, or have a session type opened that is specified in the `breakOnNext` parameter.
|sessionId| A session ID for the user specified above in `userId`.|
|snapshotVerbosity | Determines how much execution context to be recorded. If snappoint only is specified than only methods that hit a snappoint will be recorded.|


## See Also

[Attach and Debug Next](devenv-attach-debug-next.md)  
[Developing Extensions](devenv-dev-overview.md)  
[JSON Files](devenv-json-files.md)  
[AL Code Navigation](devenv-al-code-navigation.md)  
[EnableLongRunningSQLStatements Property](properties/devenv-enablelongrunningsqlstatements-property.md)  
[EnableSQLInformationDebugger Property](properties/devenv-enablesqlinformationdebugger-property.md)  
[LongrunningSQLStatementsThreshold Property](properties/devenv-longrunningsqlstatementsthreshold-property.md)  
[NumberOfSQLStatements Property](properties/devenv-numberofsqlstatements-property.md)  
