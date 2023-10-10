---
title: "AL error handling"
description: Deal with unexpected situations that occur when code is run in AL for Business Central
ms.custom: na
ms.date: 02/09/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
---

# AL error handling

The AL language has many error handling features, which can help you deal with unexpected situations that occur when code is run. This section contains articles about using these methods in AL to handle errors that occur during code execution, while making sure that your application has a consistent user interface. 

The following articles introduce error handling in AL:

- [Handling errors using Try Methods](devenv-handling-errors-using-try-methods.md)  
- [Collecting errors](devenv-error-collection.md)  
- [Progress Windows, Message, Error, and Confirm methods](devenv-progress-windows-message-error-and-confirm-methods.md)

## Error handling methods in AL

For examples of using different error handling methods in AL, see the following table:

| Method | Description |
|--------|---------|
|[ClearLastError Method](methods-auto/system/system-clearlasterror-method.md)| Removes the last error message from memory. |
|[Dialog Data Type](methods-auto/dialog/dialog-data-type.md)| Represents a dialog window. |
|[Error Method](methods-auto/dialog/dialog-error-errorinfo-method.md) | Displays an error message and ends the execution of AL code.|
|[ErrorInfo Data Type](methods-auto/errorinfo/errorinfo-data-type.md) | Contains a set of methods that helps identify errors, classify these errors, send errors to telemetry and display UI messages. Go to the data type article for an overview.|
|[System Data Type](methods-auto/system/system-data-type.md)|Is a complex data type and contains multiple methods for getting and classifying errors.|
|[GetLastErrorCallStack Method](methods-auto/system/system-getlasterrorcallstack-method.md)| Gets the call stack from where the last error occurred. |
|[GetLastErrorCode Method](methods-auto/system/system-getlasterrorcode-method.md)| Gets the classification of the last error that occurred. |
|[GetLastErrorObject Method](methods-auto/system/system-getlasterrorobject-method.md)| Gets the last System.Exception object that occurred. |
|[GetLastErrorText Method](methods-auto/system/system-getlasterrortext--method.md)| Gets the last error that occurred in the debugger. |

> [!TIP]  
> If you already know the name of a data type, use the **Filter by title** field in the upper left corner, above the table of contents to find the topic faster.

## Error handling strategies

For examples of different error handling strategies, see the following table:

| If you want to...| Then use|
|------------------|---------|
| Run a code unit and decide to do something if an error occurs. | `if not Codeunit.run()`. For more information, see [Codeunit.Run return value](methods-auto/codeunit/codeunit-run-method.md) |
| Check for an error and show an error dialog to the user. |`Dialog.Error(Message: ErrorInfo)`. For more information, see [Error Method](methods-auto/dialog/dialog-error-errorinfo-method.md). |
| Check for an error and show an error dialog to the user with added support information. | [Using the ErrorInfo Data Type with the Error Method](methods-auto/errorinfo/errorinfo-data-type.md) |
| Do bulk validations in AL and not show an error dialog for each of them to the user. | [Collecting Errors](devenv-error-collection.md) |
| Catch errors raised by other AL methods| [Handling Errors using Try Methods](devenv-handling-errors-using-try-methods.md) | 
| Catch errors/exceptions that are thrown during .NET framework interoperability operations (on-premises only). | [Handling .NET Exceptions using Try Methods](devenv-handling-errors-using-try-methods.md)|
| Log an error that happens within a database transaction (that rollback) | Either log the error in a new session using a background session, or use Session.LogMessage to log the error to telemetry. | 

## Guidelines for error messages

[!INCLUDE[error_message_guidelines](includes/include-error-message-guidelines.md)]

For more information, see [User experience guidelines for errors](devenv-error-handling-guidelines.md).


## See also

[Error message quality telemetry](../administration/telemetry-error-message-voting-trace.md)   
[Error method telemetry](../administration/telemetry-error-method-trace.md)  
[Permission error telemetry](../administration/telemetry-permission-error-trace.md)   
[Understanding the error dialog](devenv-error-dialog.md)   
[AL control statements](devenv-al-control-statements.md)   
[AL development environment](devenv-reference-overview.md)   
[User experience guidelines for errors](devenv-error-handling-guidelines.md)
