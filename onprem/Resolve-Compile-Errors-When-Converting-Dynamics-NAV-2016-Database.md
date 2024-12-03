---
title: "Compilation Errors When Converting a Microsoft Dynamics NAV 2015 or 2016 Database"
ms.date: 10/01/2018
ms.topic: article
author: jswymer
---
# Resolving Compilation Errors When Converting a Dynamics NAV 2016 Database
When you convert a [!INCLUDE[navcorfu](includes/navcorfu_md.md)] database to a newer [!INCLUDE[navnow](includes/navnow_md.md)] version, you will receive compilation errors in several standard [!INCLUDE[navnow](includes/navnow_md.md)] objects. This article describes how to resolve these errors.

## Compilation Errors
The following table lists the compilation errors that might occur when you compile and build the server application objects during the database conversion, with a link to a solution for fixing the problem.

|  Object Type  |  Object ID  |  Object Name  |  Function/Trigger  |  Error Message  |  Solution  |
|---------------|-------------|---------------|--------------------|------------|------------|
|Table|5330|CRM Connection Setup|CreateOrganizationService|You have specified an unknown variable. CrmServiceClient Define the variable under 'Global C/AL symbols'.|See [Resolving Table 5330 CRM Connection Setup Error](Resolve-Table-5330-Error-Converting-Database.md). |
|Codeunit|700|Page Management|CheckAnyRoleAssignedToUser|Type conversion is not possible because 1 of the operators contains an invalid type. Text = Integer.|See [Resolving Codeunit 700 Page Management Compilation Error](Resolve-Codunit-700-Error-Converting-Database.md). |
|Codeunit|824|DO Encryption Mgt.|Encrypt|You have specified an unknown variable. KeyExists Define the variable under 'Global C/AL symbols'.|See [Resolving Dynamics Online Payment Service Errors](Resolve-Dynamics-Online-Errors-Database-Conversion.md).|
|Codeunit|825|DO Payment Mgt.| - | - |See [Resolving Dynamics Online Payment Service Errors](Resolve-Dynamics-Online-Errors-Database-Conversion.md).|
|Codeunit|826|DO Payment Integration Mgt.|RefreshTransactionStatus|You have specified an unknown variable. Payment Define the variable under 'Global C/AL symbols'.|See [Resolving Dynamics Online Payment Service Errors](Resolve-Dynamics-Online-Errors-Database-Conversion.md).|
|Codeunit|827|DO Payment Card Validation| - | - |See [Resolving Dynamics Online Payment Service Errors](Resolve-Dynamics-Online-Errors-Database-Conversion.md).|
|Codeunit|829|DO Payment Trans. Log Mgt.|CompleteTransLogEntry|You have specified an unknown variable. IsSuccess Define the variable under 'Global C/AL symbols'.|See [Resolving Dynamics Online Payment Service Errors](Resolve-Dynamics-Online-Errors-Database-Conversion.md).|
|Codeunit|1410|Doc. Exch. Service Mgt.|Initialize|You have specified an unknown variable. Consumer Define the variable under 'Global C/AL symbols'.|See [Resolving Codeunit 1410 Doc. Exch. Service Mgt. Error](Resolve-CU1410-Doc-Exch-Service-Mgt-Compilation-Error.md).|
|Codeunit|130400|CAL Test Runner|OnBeforeTestRun|The OnBeforeTestRun trigger signature is not valid.|See [Resolving OnBeforeTestRun and OnAfterTestRun Trigger Errors](Resolve-OnBeforeTestRun-OnAfterTestRun-Compile-Errors.md).|
|Codeunit|130400|CAL Test Runner|OnAfterTestRun|The OnAfterTestRun trigger signature is not valid.|See [Resolving OnBeforeTestRun and OnAfterTestRun Trigger Errors](Resolve-OnBeforeTestRun-OnAfterTestRun-Compile-Errors.md).|
|Codeunit|130402|CAL Test Runner|OnBeforeTestRun|The OnBeforeTestRun trigger signature is not valid.|See [Resolving OnBeforeTestRun and OnAfterTestRun Trigger Errors](Resolve-OnBeforeTestRun-OnAfterTestRun-Compile-Errors.md).|
|Codeunit|130402|CAL Command Line Test Runner|OnAfterTestRun|The OnAfterTestRun trigger signature is not valid.|See [Resolving OnBeforeTestRun and OnAfterTestRun Trigger Errors](Resolve-OnBeforeTestRun-OnAfterTestRun-Compile-Errors.md).|

## See Also  
[Converting a Database](Converting-a-Database.md)
