---
title: "AL Error Handling"
description: "Error handling in AL for Business Central"
ms.custom: na
ms.date: 02/02/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# AL Error Handling

There are a number of error handling features in AL that can help you deal with unexpected situations that occur when code is run. This section contains topics about using these methods in AL to handle these errors that occur during code execution, while making sure that your application has a consistent user interface. 

The following topics introduce error handling in AL:

- [Handling Errors using Try Methods](devenv-handling-errors-using-try-methods.md)  
- [Collecting Errors](devenv-error-collection.md)  
- [Progress Windows, Message, Error, and Confirm Methods](devenv-progress-windows-message-error-and-confirm-methods.md)

## Error handling methods in AL

For examples of using different error handling methods in AL, see the following table:

| Method | Description |
|--------|---------|
|[ClearLastError Method](methods-auto/system/system-clearlasterror-method.md)| Removes the last error message from memory. |
|[Dialog Data Type](methods-auto/dialog/dialog-data-type.md)| Represents a dialog window. |
|[Error Method](methods-auto/dialog/dialog-error-errorinfo-method.md) | Displays an error message and ends the execution of AL code.|
|[ErrorInfo Data Type](methods-auto/errorinfo/errorinfo-data-type.md) | Contains a set of methods that helps identify errors, classify these errors, send errors to telemetry and display UI messages. Go to the data type topic for an overview.|
|[System Data Type](methods-auto/system/system-data-type.md)|Is a complex data type and contains multiple methods for getting and classifying errors.|
|[GetLastErrorCallStack Method](methods-auto/system/system-getlasterrorcallstack-method.md)| Gets the call stack from where the last error occurred. |
|[GetLastErrorCode Method](methods-auto/system/system-getlasterrorcode.method.md)| Gets the classification of the last error that occurred. |
|[GetLastErrorObject Method](methods-auto/system/system-getlasterrorobject-method.md)| Gets the last System.Exception object that occurred. |
|[GetLastErrorText Method](methods-auto/system/system-getlasterrortext--method.md)| Gets the last error that occurred in the debugger. |

> [!TIP]  
> If you already know the name of a data type, use the **Filter by title** field in the upper left corner, above the table of contents to find the topic faster.

## Error handling strategies

For examples of different error handling strategies, see the following table:

| If you want to...| Then use|
|------------------|---------|
| Check for an error in code and decide to do something if the error occurs. | `if Error(Message: ErrorInfo) then` |
| Check for an error and show a simple error dialog to the user. |`Dialog.Error(Message: ErrorInfo)`. For more information, see [Error Method](methods-auto/dialog/dialog-error-errorinfo-method.md). |
| Check for an error and show an error dialog to the user with added support information. | [Using the ErrorInfo Data Type](methods-auto/errorinfo/errorinfo-data-type.md) |
| Catch errors raised by other AL methods| [Handling Errors using Try Methods](devenv-handling-errors-using-try-methods.md) | 
| Do bulk validations in AL and not show an error dialog for each of them to the user | [Collecting Errors](devenv-error-collection.md) |
| Catch errors/exceptions that are thrown during .NET Framework interoperability operations (on-premises only| [Handling .NET Exceptions using Try Methods](devenv-handling-errors-using-try-methods.md)|

<!-- ## Examples

For examples of how some of these error handling methods are implemented in the base application, see the following table:

|Method|Base Application Reference|
|-----|-----|
|[GetLastErrorCallStack Method](methods-auto/system/system-getlasterrorcallstack-method.md)| See codeunit `JobQueueErrorHandler`.|
|[ClearLastError Method](methods-auto/system/system-clearlasterror-method.md)|See codeunit `BatchProcessingMgt`.| -->


## See also

[AL Control Statements](devenv-al-control-statements.md)   
[AL Development Environment](devenv-reference-overview.md)