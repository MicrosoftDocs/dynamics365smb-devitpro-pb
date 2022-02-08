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

There are a number of error handling features in AL that can help you deal with unexpected situations that occur when code is run. This section contains topics about using these methods in AL to handle these errors that occur during code execution, while making sure that your application has a consistent user interface. The following topics introduce error handling in AL.

- [Handling Errors using Try Methods](devenv-handling-errors-using-try-methods.md)  
- [Collecting Errors](devenv-error-collection.md)  
- [Progress Windows, Message, Error, and Confirm Methods](devenv-progress-windows-message-error-and-confirm-methods.md)




| If you want to...| Then use|
|------------------|---------|
| Check for an error in code and decide to do something if the error occurs. | `if <Error> then` |
| Check for an error and show a simple error dialog to the user. |`Dialog.Error(Message: ErrorInfo)`. For more information, see [Error Method](methods-auto/dialog/dialog-error-errorinfo-method.md). |
| Check for an error and show an error dialog to the user with added support information. | [ErrorInfo Data Type](methods-auto/errorinfo/errorinfo-data-type.md) |

## Overview of error handling methods in AL

|[Dialog Data Type](methods-auto/dialog/dialog-data-type.md)|[Error Method](methods-auto/dialog/dialog-error-errorinfo-method.md) |
|[System Data Type](methods-auto/system/system-data-type.md)|[ClearLastError Method](methods-auto/system/system-clearlasterror-method.md) <br>[GetLastErrorCallStack Method](methods-auto/system/system-getlasterrorcallstack-method.md)<br>[GetLastErrorCode Method](methods-auto/system/system-getlasterrorcode.method.md)<br>[GetLastErrorObject Method](methods-auto/system/system-getlasterrorobject-method.md)<br>[GetLastErrorText Method](methods-auto/system/system-getlasterrortext--method.md)|
|[ErrorInfo Data Type](methods-auto/errorinfo/errorinfo-data-type.md) | Contains a set of methods that helps identify errors, classify these errors, send errors to telemetry and display UI messages. Go to the data type topic for an overview.|

> [!TIP]  
> If you already know the name of a data type, use the **Filter by title** field in the upper left corner, above the table of contents to find the topic faster.

## Examples

For examples of how some of these error handling methods are implemented in the base application, see the following table:

|Method|Base Application Reference|
|-----|-----|
|[GetLastErrorCallStack Method](methods-auto/system/system-getlasterrorcallstack-method.md)| See codeunit `JobQueueErrorHandler`.|
|[ClearLastError Method](methods-auto/system/system-clearlasterror-method.md)|See codeunit `BatchProcessingMgt`.|


## See also

[AL Control Statements](devenv-al-control-statements.md)   
[AL Development Environment](devenv-reference-overview.md)