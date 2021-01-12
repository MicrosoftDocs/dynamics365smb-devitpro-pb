---
title: "Session.StartSession Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Session.StartSession Method
> **Version**: _Available from runtime version 1.0._

Starts a session without a UI and runs the specified codeunit.


## Syntax
```
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
        
*Company*  
&emsp;Type: [String](../string/string-data-type.md)  
The company in which to start the session. By default, the session is started in the same company as the calling session.
        
*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
A record that is passed to the OnRun trigger of the codeunit that runs when the session is started. This parameter is optional.
          


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The session is started on the same [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance from which the method is called. The session that is started is a background session and therefore has no UI. The session executes using the same user credentials as the calling AL code.  

 The following table describes how dialog boxes are handled in a background session, which has no UI.  

|Method that creates the dialog box|Behavior|  
|------------------------------------------|--------------|  
|[CONFIRM Method \(Dialog\)](../../methods/devenv-confirm-method-dialog.md)|-   Dialog box is suppressed.<br />-   The following error occurs on the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance: **[!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] attempted to issue a client callback to show a confirmation dialog box.**|  
|[ERROR Method \(Dialog\)](../../methods/devenv-error-method-dialog.md)|-   Dialog box is suppressed.<br />-   AL code execution ends.<br />-   The error is logged to the event log of the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance.<br />-   The error is added to the **Comments** field of the **Session Event** table.|  
|[Message Method \(Dialog\)](../../methods/devenv-message-method-dialog.md)|-   Dialog box is suppressed.<br />-   The message is recorded in the event log of the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance. The log entry has type Information and includes the context of the message.|  
|[Open Method \(Dialog\)](../../methods/devenv-open-method-dialog.md)|-   Dialog box is suppressed.<br />-   Dialog box text is not displayed or logged.|  

 Each background session has the same impact on resources as a regular user session. In addition, it takes time and resources to start each background session. Therefore, we recommend that you consider when and how you use background sessions. For example, do not use background sessions for small tasks that occur often because the cost of starting the session for each tasks is high.  

## Example  
 In this example, the Cache Stress Test codeunit is a custom codeunit.  

```
var
    CacheStressTestRec: Record Customer;
    SessionID: Integer;
    OK: Boolean;
begin  
    OK := StartSession(SessionId, CODEUNIT::"Cache Stress Test", COMPANYNAME, CacheStressTestRec);  
    if OK then  
      STOPSESSION(SessionId, 'Logoff cache stress test session')  
    else  
      ERROR('The session was not started successfully.');  
end;
```  

## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)