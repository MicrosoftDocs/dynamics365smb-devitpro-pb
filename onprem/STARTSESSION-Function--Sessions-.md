---
title: "STARTSESSION Function (Sessions)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5b45f707-c33c-4b93-8192-cf9f31a5f403
caps.latest.revision: 13
manager: edupont
---
# STARTSESSION Function (Sessions)
Starts a [!INCLUDE[navnow](includes/navnow_md.md)] session without a UI and runs the specified codeunit.  

## Syntax  

```  
[OK :=] STARTSESSION(VAR SessionID, CodeunitID [, CompanyName] [,Record])  
```  

#### Parameters  
 *SessionID*  
 Type: Integer  

 The ID of the new session that is started. The ID is assigned to the *SessionID* variable after the session is started successfully.  

 This parameter is passed by reference to the function. For more information about passing parameters by reference, see [C/AL Function Calls](C-AL-Function-Calls.md).  

 *CodeunitID*  
 Type: Integer  

 The ID of the codeunit to run when the session is started.  

 *CompanyName*  
 Type: Text  

 The company in which to start the session. By default, the session is started in the same company as the calling session.  

 This parameter is optional.  

 *Record*  
 Type: Record  

 A record that is passed to the OnRun trigger of the codeunit that runs when the session is started.  

 This parameter is optional.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if the session started successfully and no errors occurred; otherwise **false**.  

 If you omit this optional return value and the session is not started successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  

## Remarks  
 The session is started on the same [!INCLUDE[nav_server](includes/nav_server_md.md)] instance from which the function is called. The session that is started is a background session and therefore has no UI. The session executes using the same user credentials as the calling C/AL code.  

 The following table describes how dialog boxes are handled in a background session, which has no UI.  

|Function that creates the dialog box|Behavior|  
|------------------------------------------|--------------|  
|[CONFIRM Function \(Dialog\)](CONFIRM-Function--Dialog-.md)|-   Dialog box is suppressed.<br />-   The following error occurs on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance: **[!INCLUDE[nav_server](includes/nav_server_md.md)] attempted to issue a client callback to show a confirmation dialog box.**|  
|[ERROR Function \(Dialog\)](ERROR-Function--Dialog-.md)|-   Dialog box is suppressed.<br />-   C/AL code execution ends.<br />-   The error is logged to the event log of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.<br />-   The error is added to the **Comments** field of the **Session Event** table.|  
|[MESSAGE Function \(Dialog\)](MESSAGE-Function--Dialog-.md)|-   Dialog box is suppressed.<br />-   The message is recorded in the event log of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. The log entry has type Information and includes the context of the message.|  
|[OPEN Function \(Dialog\)](OPEN-Function--Dialog-.md)|-   Dialog box is suppressed.<br />-   Dialog box text is not displayed or logged.|  

 Each background session has the same impact on resources as a regular user session. In addition, it takes time and resources to start each background session. Therefore, we recommend that you consider when and how you use background sessions. For example, do not use background sessions for small tasks that occur often because the cost of starting the session for each tasks is high.  

## Example  
 This example requires that you create the following variables.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|OK|Boolean|Not applicable|  
|SessionID|Integer|Not applicable|  
|CacheStressTestRec|Record|Customer|  

 In this example, the Cache Stress Test codeunit is a custom codeunit.  

```  
OK := STARTSESSION(SessionId, CODEUNIT::"Cache Stress Test", COMPANYNAME, CacheStressTestRec);  
IF OK THEN  
  STOPSESSION(SessionId, 'Logoff cache stress test session')  
ELSE  
  ERROR('The session was not started successfully.');  
```  

## See Also  
 [Printing Reports from a Background Session](Printing-Reports-from-a-Background-Session.md)   
 [How to: Debug a Background Session](How-to--Debug-a-Background-Session.md)
