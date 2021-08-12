---
title: "Session.StartSession(var Integer, Integer, Duration [, String] [, var Record]) Method"
description: "Starts a session without a UI and runs the specified codeunit."
ms.author: solsen
ms.custom: na
ms.date: 08/10/2021
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
# Session.StartSession(var Integer, Integer, Duration [, String] [, var Record]) Method
> **Version**: _Available or changed with runtime version 7.1._

Starts a session without a UI and runs the specified codeunit.


## Syntax
```AL
[Ok := ]  Session.StartSession(var SessionId: Integer, CodeunitId: Integer, Timeout: Duration [, Company: String] [, var Record: Record])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*SessionId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the new session that is started. The ID is assigned to the SessionID variable after the session is started successfully. This parameter is passed by reference to the method.  
*CodeunitId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the codeunit to run when the session is started.  
*Timeout*  
&emsp;Type: [Duration](../duration/duration-data-type.md)  
Specifies the timeout of the created session. If not specified a default timeout will be used; for OnPrem, the default timeout is set on the server, for SaaS the current default timeout is 12 hours, and may change in the future.  
*[Optional] Company*  
&emsp;Type: [String](../string/string-data-type.md)  
The company in which to start the session. By default, the session is started in the same company as the calling session.  
*[Optional] Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
A record that is passed to the OnRun trigger of the codeunit that runs when the session is started.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The session is started on the same [!INCLUDE[prod_short](../../includes/prod_short.md)] instance from which the method is called. The session that is started is a background session and therefore has no UI. The session executes using the same user credentials as the calling AL code.  

For information about how dialog boxes are handled in a background session, see [Dialog box behavior](session-startsession-integer-integer-string-table-method.md#dialog-box-behavior).  
## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
