---
title: "Session.LogAuditMessage(Text, SecurityOperationResult, AuditCategory, Integer, Integer [, Dictionary of [Text, Text]]) Method"
description: "Logs a message to an audit account."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Session.LogAuditMessage(Text, SecurityOperationResult, AuditCategory, Integer, Integer [, Dictionary of [Text, Text]]) Method
> **Version**: _Available or changed with runtime version 13.1._

Logs a message to an audit account. Note, these logs are accessible to customers and will also be logged to a security audit account.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
 Session.LogAuditMessage(SecurityAuditDescription: Text, SecurityAuditOperationResult: SecurityOperationResult, SecurityAuditCategory: AuditCategory, AuditMessageOperation: Integer, AuditMessageOperationResult: Integer [, CustomDimensions: Dictionary of [Text, Text]])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*SecurityAuditDescription*  
&emsp;Type: [Text](../text/text-data-type.md)  
The description for the security audit message.  

*SecurityAuditOperationResult*  
&emsp;Type: [SecurityOperationResult](../securityoperationresult/securityoperationresult-option.md)  
The operation result for the security audit message.  

*SecurityAuditCategory*  
&emsp;Type: [AuditCategory](../auditcategory/auditcategory-option.md)  
The category of the operation for the security audit message.  

*AuditMessageOperation*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The operation type for the audit message. Specify one of the following values:
- 0: AdministeredEnvironment.
- 1: ConfiguredExtension.
- 2: AdministeredUser.
- 3: AdministeredCompany.
- 4: ConfiguredIntegration.
- 5: ConfiguredCopilot.
- 6: ConfiguredCloudMigration.
- 7: AdministeredReport.  

*AuditMessageOperationResult*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The operation result for the audit message. Specify one of the following values:
- 0: Succeeded.
- 1: PartiallySucceeded.
- 2: Failed.  

*[Optional] CustomDimensions*  
&emsp;Type: [Dictionary of [Text, Text]](../dictionary/dictionary-data-type.md)  
Set of additional dimensions, specified as a dictionary, that will be emitted to the telemetry account and that can be used to specify filters in the query.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)