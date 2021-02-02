---
title: "Compilation Errors When Converting Dynamics NAV 2018 Database"
description: Learn how to resolve errors when you convert a Dynamics NAV database to the Business Central format.
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-business-central
author: jswymer
---
# Resolving Compilation Errors When Converting a Dynamics NAV 2018 Database
When you convert a [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database to a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version, you will receive compilation errors in several standard [!INCLUDE[navnow](../developer/includes/navnow_md.md)] objects. This article describes how to resolve these errors.

## Compilation Errors
The following table lists the compilation errors that might occur when you compile objects during the database conversion.

|  Object Type  |  Object ID  |  Object Name  |  Function/Trigger  |  Error Message  |  Solution  |
|---------------|-------------|---------------|--------------------|------------|------------|
|Table|5330|CRM Connection Setup|CreateOrganizationService|You have specified an unknown variable. CrmServiceClient Define the variable under 'Global C/AL symbols'.|If the application integrates with [!INCLUDE[crm_md](../developer/includes/crm_md.md)], then to resolve this error, you must perform a full upgrade (application code and data). For more information, see [Important Information and Considerations for Before Upgrading](upgrade-considerations.md#CRM). If not integrating with [!INCLUDE[crm_md](../developer/includes/crm_md.md)], you can ignore this error. |
|Table|8620|Config. Tmpl. Selection Rules|OnValidate|Type conversion is not possible because 1 of the operators contains an invalid type. Integer := Text|[Resolving Table 8620 Compilation Error](resolve-table-8620-error-converting-database.md)|
|Codeunit|700|Page Management|VerifyPageID|Type conversion is not possible because 1 of the operators contains an invalid type. Text = Integer| [Resolving Codeunit 700 Compilation Error](resolve-cu-700-error-converting-database.md)|
|Codeunit|5330|CRM Integration Management|ImportCRMSolution|You have specified an unknown variable. ServiceManagement Define the variable under 'Global C/AL symbols'.| If the application integrates with [!INCLUDE[crm_md](../developer/includes/crm_md.md)], then to resolve this error, you must perform a full upgrade (application code and data). For more information, see [Important Information and Considerations for Before Upgrading](upgrade-considerations.md#CRM). If not integrating with [!INCLUDE[crm_md](../developer/includes/crm_md.md)], you can ignore this error. |
|Codeunit|9010|Azure AD User Management|CreateNewUsersFromAzureAD|You have specified an unknown variable. GetUsersPage Define the variable under 'Global C/AL symbols'.| [Resolving Codeunit 9010 Compilation Error](Resolve-cu-9010-error-converting-database.md). |
|Page|2500|Extension Management|OnAction|There is no overload for method 'GenerateDesignerPackageZipStream' that takes '2' arguments.|[Resolving Page 2500 Compilation Error](resolve-page-2500-error-converting-database.md)|
|Page|6400|Flow Selector|FlowAddin::ControlAddInReady|When the function is called, the minimum number of parameters should be used. For example: MyFunc( .. , .. , .. )|[Resolving Page 6400 and 6410 Compilation Errors](resolve-page-6400-6401-error-converting-database.md). |
|Page|6401|Flow Template Selector|FlowAddin::ControlAddInReady|When the function is called, the minimum number of parameters should be used. For example: MyFunc( .. , .. , .. )|[Resolving Page 6400 and 6410 Compilation Errors](resolve-page-6400-6401-error-converting-database.md). |
|Page|9624|Finish Design List Part|GetTaskDisplayName|You have specified an unknown variable. Display Name Define the variable under 'Global C/AL symbols'.|See [Resolving Page 9624 Compilation Error](Resolve-Page-9624-Error-Converting-Database.md). |
|Table|    1670|Option Lookup Buffer|FillBufferInternal|'SETPERMISSIONFILTER' is obsolete for Microsoft Dynamics NAV Server.|This warning and can be ignored.|
|Codeunit|1751|Data Classification Eval. Data|ClassifySession|The 'Record2000000009' type is obsolete.|This warning and can be ignored or to clear it, remove the procedure `LOCAL PROCEDURE ClassifySession@72();` and the reference to it.|

<!--
|Codeunit|6723|Server Config. Setting Handler|InitializeConfigSettings|You have specified an unknown variable. Instance Define the variable under 'Global C/AL symbols'||

|Page|9623|Finish Up Design|OnInit|You have specified an unknown variable. GetDesignerExtensionName Define the variable under 'Global C/AL symbols'.||
>
## See Also  
[Converting a Database - Technical Upgrade](Converting-a-Database.md)  
