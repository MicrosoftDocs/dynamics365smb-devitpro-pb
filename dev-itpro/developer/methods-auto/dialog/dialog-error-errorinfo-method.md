---
title: "Dialog.Error(ErrorInfo) Method"
description: "Displays an error message and ends the execution of AL code."
ms.author: solsen
ms.date: 12/20/2023
ms.reviewer: jswymer
ms.topic: reference
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

> [!NOTE]
> Use this version of the `Dialog.Error` method compared to the older [Dialog.Error(Text [, Any,...]) Method](dialog-error-string-joker-method.md) that only supports inputing a string for the error message body.


## Guidelines for error messages

[!INCLUDE[error_message_guidelines](../../includes/include-error-message-guidelines.md)]

## Example  

This example shows how to use the **Error** method. 
 
```al
procedure InitializeFromCurrentApp()
var
    DoNotBlockErrorInfo: ErrorInfo;
    IsBlocked: Boolean;
begin
    IsBlocked := // Some logic that determines whether the account is blocked
    
    if IsBlocked then
    begin
        // setup ErrorInfo object
        DoNotBlockErrorInfo.Message = 'Finance Account 1230 must not be blocked.');
        DoNotBlockErrorInfo.DetailedMessage = 'Some additional information that can help the person troubleshooting this issue.');
        // Add more properties for ErrorInfo depending on the scenario
        //   Maybe add a title to the error message 
        //   Maybe make the error message actionable (add fix-it or show-it actions)

        Error(DoNotBlockErrorInfo);

        // Code execution stops here
        Message('This line will never run');
    end;
end;
```  

The error window displays the following:  

**Finance Account 1230 must not be blocked.**  

The `Error` method causes execution of AL code to stop. [Message Method](../../methods-auto/dialog/dialog-message-method.md) is never executed.  

## See Also
[Error handling overview](../../devenv-al-error-handling.md)  
[Analyzing Error Method Telemetry](../../../administration/telemetry-error-method-trace.md)   
[Dialog Data Type](dialog-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
