---
title: "Session.LogSecurityAudit(Text, SecurityOperationResult, Text, AuditCategory [, Array of [Text]] [, Array of [Text]]) Method"
description: "Logs an IfX audit message to a telemetry account."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Session.LogSecurityAudit(Text, SecurityOperationResult, Text, AuditCategory [, Array of [Text]] [, Array of [Text]]) Method
> **Version**: _Available or changed with runtime version 7.0._

Logs an IfX audit message to a telemetry account.


## Syntax
```AL
 Session.LogSecurityAudit(Description: Text, Result: SecurityOperationResult, ResultDescription: Text, AuditCategory: AuditCategory [, TargetType: Array of [Text]] [, TargetName: Array of [Text]])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Description*  
&emsp;Type: [Text](../text/text-data-type.md)  
The description for the audit message.  

*Result*  
&emsp;Type: [SecurityOperationResult](../securityoperationresult/securityoperationresult-option.md)  
The result state of the operation.  

*ResultDescription*  
&emsp;Type: [Text](../text/text-data-type.md)  
The description of the result state.  

*AuditCategory*  
&emsp;Type: [AuditCategory](../auditcategory/auditcategory-option.md)  
The category of the audit message.  

*[Optional] TargetType*  
&emsp;Type: [Text](../text/text-data-type.md)  
The target type(s) of this audit message must correspond to target name(s).  

*[Optional] TargetName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The target name(s) of this audit message must correspond to target type(s).  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Session Data Type](session-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)