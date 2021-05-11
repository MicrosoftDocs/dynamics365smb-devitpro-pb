---
title: "Session.LogSecurityAudit Method"
description: "Logs an IfX audit message to a telemetry account."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Session.LogSecurityAudit Method
> **Version**: _Available or changed with runtime version 7.0._

Logs an IfX audit message to a telemetry account.


## Syntax
```
 Session.LogSecurityAudit(Description: String, Result: SecurityOperationResult, ResultDescription: String, AuditCategory: AuditCategory [, TargetType: Array of [String]] [, TargetName: Array of [String]])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Description*  
&emsp;Type: [String](../string/string-data-type.md)  
The description for the audit message.  
*Result*  
&emsp;Type: [SecurityOperationResult](../securityoperationresult/securityoperationresult-option.md)  
The result state of the operation.  
*ResultDescription*  
&emsp;Type: [String](../string/string-data-type.md)  
The description of the result state.  
*AuditCategory*  
&emsp;Type: [AuditCategory](../auditcategory/auditcategory-option.md)  
The category of the audit message.  
*TargetType*  
&emsp;Type: [String](../string/string-data-type.md)  
The target type(s) of this audit message must correspond to target name(s).  
*TargetName*  
&emsp;Type: [String](../string/string-data-type.md)  
The target name(s) of this audit message must correspond to target type(s).  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Session Data Type](session-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)  