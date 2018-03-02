---
title: "ENABLESQLTRACE Method (Debugger)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 9bd5ad29-12d7-4f24-a7b2-3d4d16198010
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ENABLESQLTRACE Method (Debugger)
Enables or verifies SQL tracing. If you enable SQL tracing, then SQL Server events for selected sessions on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance are collected.  
  
## Syntax  
  
```  
[IsEnabled :=] ENABLESQLTRACE(SessionID [,NewIsEnabled])  
```  
  
#### Parameters  
 *SessionID*  
 Type: Integer  
  
 The ID of the session for which you want to enable the SQL trace, or for which you want to verify if tracing is enabled.  
  
 If you specify 0 and you specify the *NewIsEnabled* parameter, then tracing is enabled for all existing sessions and all new sessions on the current [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance. If you specify 0 and you omit the *NewIsEnabled* parameter, then the method returns **true** if tracing is enabled for new sessions on the current [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance.  
  
 If the session ID that you specify does not exist and you specify the *NewIsEnabled* parameter, then a run-time error occurs. If the session ID that you specify does not exist and you do not specify the *NewIsEnabled* parameter, then the method returns **false**.  
  
 *NewIsEnabled*  
 Type: Boolean  
  
 If you specify the optional *NewIsEnabled* parameter, then the method sets whether tracing is enabled. **true** if you want to enable tracing for the specified session; **false** if you want to disable tracing. If you omit the *NewIsEnabled* parameter, then the method verifies if tracing is enabled.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if SQL tracing is enabled; otherwise, **false**.  
  
## Remarks  
 You use Microsoft SQL Server Profiler to view traces. For more information, see [Using SQL Server Profiler](http://go.microsoft.com/fwlink/?LinkId=257789). To start SQL Server Profiler, in **SQL Server Management Studio**, on the **Tools** menu, choose **SQL Server Profiler**.  
  
 You can also enable and disable SQL tracing by using the **Start Full SQL Tracing** and **Stop Full SQL Tracing** buttons on the **Session List** page.  
  
## See Also  
 <!--Links [Debugging](Debugging.md) -->