---
title: "Dialog.Error(Text [, Any,...]) Method"
description: "Displays an error message and ends the execution of AL code (joker version)."
ms.author: solsen
ms.date: 12/20/2023
ms.reviewer: jswymer
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Dialog.Error(Text [, Any,...]) Method
> **Version**: _Available or changed with runtime version 1.0._

Displays an error message and ends the execution of AL code.


## Syntax
```AL
 Dialog.Error(Message: Text [, Value: Any,...])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Message*  
&emsp;Type: [Text](../text/text-data-type.md)  
This string contains the text of the error message you want to display to the user. Use percent signs (%) or number signs (#) to insert variable values into the string. Place the percent or number signs where you want to substitute the variable value. The string can be a label that is enabled for multilanguage functionality.  

*[Optional] Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
Any variable or expression to be inserted in String. You can insert up to 10 values. For '#'-type fields, the value is truncated according to the total number of number-sign characters in String. For '%'-type fields, the full length of the value is printed.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Remarks  

The window is automatically sized to hold the longest line of text and total number of lines. By calling the method with an **empty** string the execution of AL code ends without displaying a message. 

> [!NOTE]
> Consider using the newer version of the `Dialog.Error` method [Dialog.Error(ErrorInfo) Method](dialog-error-errorinfo-method.md) to use many of the newer features in error dialogs, such as (hidden) detailed error messages for the person who needs to troubleshoot, error message titles, and support for actionable errors.

## Guidelines for error messages

[!INCLUDE[error_message_guidelines](../../includes/include-error-message-guidelines.md)]

## Example  

This example shows how to use the `Error` method. 
 
```al
var
    AccountNo: Integer;
    Text000: Label 'Finance Account #1#### must not be blocked.';
    Text001: Label 'Placeholder message.';   
begin 
    AccountNo := 1230;  

    // The execution stops when the error statement is executed  
    // and all following statements will never be executed.  
    Error(Text000, AccountNo);  

    Message(Text001); // This line is not executed.  
end;
```  

The error window displays the following:  

**Finance Account 1230 must not be blocked.**  

The `Error` method causes execution of AL code to stop. [Message Method](../../methods-auto/dialog/dialog-message-method.md) is never executed.  

## See Also
[Dialog.Error(ErrorInfo) method](dialog-error-errorinfo-method.md)   
[Error handling overview](../../devenv-al-error-handling.md)  
[Analyzing Error method telemetry](../../../administration/telemetry-error-method-trace.md)   
[Dialog data type](dialog-data-type.md)  
[Get started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)  
