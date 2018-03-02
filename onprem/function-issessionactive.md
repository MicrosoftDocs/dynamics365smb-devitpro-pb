---
title: "ISSESSIONACTIVE Function (Debugger)"
author: edupont04
manager: edupont04
ms.custom: na
ms.date: 08/22/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---
# ISSESSIONACTIVE Function (Session)
Tests if the specified SessionID is active on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance where it was started.  

## Syntax  

```  
Ok := ISSESSIONACTIVE(SessionID)   
```  

## Parameters
*SessionID*
    Type: Integer
    The ID of the session that you want to test if it is still active.
## Property Value/Return Value  
Type: Boolean  

**true** if a session with a specified ID is active on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance; otherwise, **false**.  

## Remarks
Use this function to test if a session has completed or is still active, for example if you want to check that a session started with STARTSESSION is still running.  

>   [!NOTE]  
>    The function looks for sessions on the local machine.


## See Also  
[STARTSESSION](STARTSESSION-Function--Sessions-.md)  
