---
title: "Debugger Data Type"
ms.author: solsen
ms.custom: na
ms.date: 12/09/2020
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
# Debugger Data Type
> **Version**: _Available from runtime version 1.0._

Enables communication with a debugger.

> [!NOTE]
> This data type is supported only in Business Central on-premises.

The following methods are available on the Debugger data type.


|Method name|Description|
|-----------|-----------|
|[Activate()](debugger-activate-method.md)|Activates the debugger and attaches the debugger to the next session that is started.|
|[Attach(Integer)](debugger-attach-method.md)|Activates the debugger and attaches it to the specified session.|
|[Break()](debugger-break-method.md)|Breaks code execution of a debugging session.|
|[BreakOnError(Boolean)](debugger-breakonerror-method.md)|Sets whether the debugger breaks on errors.|
|[BreakOnRecordChanges(Boolean)](debugger-breakonrecordchanges-method.md)|Breaks execution before a change to a record occurs.|
|[Continue()](debugger-continue-method.md)|Executes code until the next breakpoint or until execution ends.|
|[Deactivate()](debugger-deactivate-method.md)|Deactivates the debugger.|
|[DebuggedSessionID()](debugger-debuggedsessionid-method.md)|Gets the ID of the previous session that the debugger was attached to.|
|[DebuggingSessionID()](debugger-debuggingsessionid-method.md)|Gets the ID of the session that the debugger is currently attached to.|
|[EnableSqlTrace(Integer [, Boolean])](debugger-enablesqltrace-method.md)|Enables or verifies SQL tracing. If you enable SQL tracing, then SQL Server events for selected sessions on the server instance are collected.|
|[GetLastErrorText()](debugger-getlasterrortext-method.md)|Gets the last error that occurred in the debugger.|
|[IsActive()](debugger-isactive-method.md)|Indicates whether the debugger is active.|
|[IsAttached()](debugger-isattached-method.md)|Specifies if the debugger is attached to a session.|
|[IsBreakpointHit()](debugger-isbreakpointhit-method.md)|Specifies if a breakpoint is hit in a debugging session.|
|[SkipSystemTriggers(Boolean)](debugger-skipsystemtriggers-method.md)|Enables the debugger to skip code that is inside system triggers.|
|[StepInto()](debugger-stepinto-method.md)|Executes a method call and then stops at the first line of code inside the method.|
|[StepOut()](debugger-stepout-method.md)|Enables debugging to return to the calling method after it steps into a method call.|
|[StepOver()](debugger-stepover-method.md)|Executes a method call and then stops at the first line outside the method call.|
|[Stop()](debugger-stop-method.md)|Stops execution as if the code hits an error.|


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> The Dynamics 365 Business Central Debugger is an example of a debugger application that is built using tables, pages, codeunits, and the AL debugger methods.

## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  