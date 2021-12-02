---
title: "Dialog.Error(ErrorInfo) Method"
description: "Displays an error message and ends the execution of AL code."
ms.author: solsen
ms.custom: na
ms.date: 11/05/2021
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
# Dialog.Error(ErrorInfo) Method
> **Version**: _Available or changed with runtime version 3.0._

Displays an error message and ends the execution of AL code.

> [!NOTE]
> From runtime version 8.0 and onward, this method is supported in Business Central online.

## Syntax
```AL
 Dialog.Error(Message: ErrorInfo)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Message*  
&emsp;Type: [ErrorInfo](../errorinfo/errorinfo-data-type.md)  
The ErrorInfo structure that contains error message, error type, verbosity, and data classification.
        



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Remarks  

The window is automatically sized to hold the longest line of text and total number of lines.  

## Programming Guidelines  

We recommend the following guidelines for error messages:  

- Describe what is wrong and how to solve the problem.  

- Write a short descriptive message. Do not use more words than necessary.  

- Always end the error message with a period.  

- Use a text constant for the text of the message.  

For more information, see [Progress Windows, Message, Error, and Confirm Methods](../../devenv-progress-windows-message-error-and-confirm-methods.md).  

## Example  

This example shows how to use the **Error** method. 
 
```al
procedure InitializeFromCurrentApp()
var
    InitializeErrorInfo: ErrorInfo;
begin
    // Initialize the .NET object
    if InitializeFromCurrentAppInternal() then
        IsInitialized := true
    else begin
        InitializeErrorInfo.DataClassification := DataClassification::SystemMetadata;
        InitializeErrorInfo.ErrorType := ErrorType::Client;
        InitializeErrorInfo.Verbosity := Verbosity::Error;
        InitializeErrorInfo.Message := CannotInitializeErr;
        Error(InitializeErrorInfo);
    end;
end;
```  

The error window displays the following:  

**Finance Account 1230  must not be blocked.**  

The `Error` method causes execution of AL code to stop. [Message Method](../../methods-auto/dialog/dialog-message-method.md) is never executed.  

## See Also
[Dialog Data Type](dialog-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)