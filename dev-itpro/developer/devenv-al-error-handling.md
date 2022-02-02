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

There are a number of error handling features in AL that can help you deal with unexpected situations that occur when code is run. This section contains topics about using these methods in AL to handle these errors that occur during code execution, while making sure that your application has a consistent user interface. The following conceptual topics introduce error handling in AL.

- [Handling Errors using Try Methods](devenv-handling-errors-using-try-methods.md)  
- [Collecting Errors](devenv-error-collection.md)  
- [Progress Windows, Message, Error, and Confirm Methods](devenv-progress-windows-message-error-and-confirm-methods.md)

## Error handling methods in AL

The following error handling methods are available in AL.

For the [Dialog Data Type](methods-auto/dialog/dialog-data-type.md):

- [Error Method](methods-auto/dialog/dialog-error-errorinfo-method.md)  

For the [System Data Type](methods-auto/system/system-data-type.md):

- [ClearLastError Method](methods-auto/system/system-clearlasterror-method.md)  
- [GetLastErrorCallStack Method](methods-auto/system/system-getlasterrorcallstack-method.md)  
- [GetLastErrorCode Method](methods-auto/system/system-getlasterrorcode.method.md)  
- [GetLastErrorObject Method](methods-auto/system/system-getlasterrorobject-method.md)  
- [GetLastErrorText Method](methods-auto/system/system-getlasterrortext-method.md)  

The [ErrorInfo Data Type](methods-auto/errorinfo/errorinfo-data-type.md) contains a set of methods that helps identify errors, classify these errors, send errors to telemetry and display UI messages.

The following error option type is available for AL:

[ErrorType Option](methods-auto/errortype/errortype-option.md)

## See also

[AL Control Statements](devenv-al-control-statements.md)   
[AL Development Environment](devenv-reference-overview.md)