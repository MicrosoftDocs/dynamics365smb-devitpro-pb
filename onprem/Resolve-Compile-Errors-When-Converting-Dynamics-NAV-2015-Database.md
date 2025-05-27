---
title: "Compilation Errors When Converting a Microsoft Dynamics NAV 2015 Database"
ms.date: 10/01/2018
ms.topic: article
author: jswymer
---
# Resolving Compilation Errors When Converting a Dynamics NAV 2015
When you convert a [!INCLUDE[navcrete](includes/navcrete_md.md)] to a newer version, you will receive compilation errors in several standard [!INCLUDE[navnow](includes/navnow_md.md)] objects. This article describes how to resolve these errors.

## Compilation Errors
The following table lists the compilation errors that might occur when you compile objects or build the server application objects during the database conversion, with a link to a solution for fixing the problem.

|  Object Type  |  Object ID  |  Object Name  |  Function/Trigger  |  Error Message  |  Solution  |
|---------------|-------------|---------------|--------------------|------------|------------|
|Codeunit|824|DO Encryption Mgt.|Encrypt|You have specified an unknown variable. KeyExists Define the variable under 'Global C/AL symbols'.|See [Resolving Dynamics Online Payment Service Errors](Resolve-Dynamics-Online-Errors-Database-Conversion.md).|
|Codeunit|825|DO Payment Mgt.| - | - |See [Resolving Dynamics Online Payment Service Errors](Resolve-Dynamics-Online-Errors-Database-Conversion.md).|
|Codeunit|826|DO Payment Integration Mgt.|RefreshTransactionStatus|You have specified an unknown variable. Payment Define the variable under 'Global C/AL symbols'.|See [Resolving Dynamics Online Payment Service Errors](Resolve-Dynamics-Online-Errors-Database-Conversion.md).|
|Codeunit|827|DO Payment Card Validation| - | - |See [Resolving Dynamics Online Payment Service Errors](Resolve-Dynamics-Online-Errors-Database-Conversion.md).|
|Codeunit|829|DO Payment Trans. Log Mgt.|CompleteTransLogEntry|You have specified an unknown variable. IsSuccess Define the variable under 'Global C/AL symbols'.|See [Resolving Dynamics Online Payment Service Errors](Resolve-Dynamics-Online-Errors-Database-Conversion.md).|

## See Also  
[Converting a Database](Converting-a-Database.md)
