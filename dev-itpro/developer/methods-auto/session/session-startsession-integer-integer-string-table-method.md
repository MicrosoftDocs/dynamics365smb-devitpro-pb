---
title: "Session.StartSession(var Integer, Integer [, String] [, var Record]) Method"
description: "Starts a session without a UI and runs the specified codeunit."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# Session.StartSession(var Integer, Integer [, String] [, var Record]) Method
> **Version**: _Available or changed with runtime version 1.0._

Starts a session without a UI and runs the specified codeunit.


## Syntax
```AL
[Ok := ]  Session.StartSession(var SessionId: Integer, CodeunitId: Integer [, Company: String] [, var Record: Record])
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
*[Optional] Company*  
&emsp;Type: [String](../string/string-data-type.md)  
The company in which to start the session. By default, the session is started in the same company as the calling session.  
*[Optional] Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
A record that is passed to the OnRun trigger of the codeunit that runs when the session is started. This parameter is optional.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

 The session is started on the same [!INCLUDE[prod_short](../../includes/prod_short.md)] instance from which the method is called. The session that is started is a background session and therefore has no UI. The session executes using the same user credentials as the calling AL code.

Each background session has the same impact on resources as a regular user session. In addition, it takes time and resources to start each background session. Therefore, we recommend that you consider when and how you use background sessions. For example, do not use background sessions for small tasks that occur often because the cost of starting the session for each tasks is high.

### Dialog box behavior

The following table describes how dialog boxes are handled in a background session, which has no UI.  

|Method that creates the dialog box|Behavior|  
|------------------------------------------|--------------|  
|[Dialog.Confirm](../dialog/dialog-confirm-method.md)|-   Dialog box is suppressed.<br />-   The following error occurs on the [!INCLUDE[prod_short](../../includes/prod_short.md)] instance: **[!INCLUDE[prod_short](../../includes/prod_short.md)] attempted to issue a client callback to show a confirmation dialog box.**|  
|[Dialog.Error](../dialog/dialog-error-string-joker-method.md)|-   Dialog box is suppressed.<br />-   AL code execution ends.<br />-   The error is logged to the event log of the [!INCLUDE[prod_short](../../includes/prod_short.md)] instance.<br />-   The error is added to the **Comments** field of the **Session Event** table.|  
|[Dialog.Message](../dialog/dialog-message-method.md)|-   Dialog box is suppressed.<br />-   The message is recorded in the event log of the computer that is running [!INCLUDE[prod_short](../../includes/prod_short.md)] instance. The log entry has type Information and includes the context of the message.|  
|[Dialog.Open](../dialog/dialog-open-method.md)|-   Dialog box is suppressed.<br />-   Dialog box text is not displayed or logged.|  

## Example

In this example, the Cache Stress Test codeunit is a custom codeunit.  

```al
var
    CacheStressTestRec: Record Customer;
    SessionID: Integer;
    OK: Boolean;
begin  
    OK := StartSession(SessionId, CodeUnit::"Cache Stress Test", CompanyName, CacheStressTestRec);  
    if OK then  
      StopSession(SessionId, 'Logoff cache stress test session')  
    else  
      Error('The session was not started successfully.');  
end;
```
  
## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  