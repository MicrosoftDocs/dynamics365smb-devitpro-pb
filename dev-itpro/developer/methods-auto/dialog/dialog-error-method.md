---
title: "Error Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Error Method
Displays an error message and ends the execution of AL code.

## Syntax
```
 Dialog.Error(Message: String, [Value: Any,...])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Message*  
&emsp;Type: [String](../string/string-data-type.md)  
This string contains the text of the error message you want to display to the user. Use percent signs (%) or number signs (#) to insert variable values into the string. Place the percent or number signs where you want to substitute the variable value. The string can be a text constant that is enabled for multilanguage functionality.
        
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
Any variable or expression to be inserted in String. You can insert up to 10 values. For '#'-type fields, the value is truncated according to the total number of number-sign characters in String. For '%'-type fields, the full length of the value is printed.
          



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

**Finance Account 1230  must not be blocked.**  

The `Error` method causes execution of AL code to stop. [Message Method](../../methods-auto/dialog/dialog-message-method.md) is never executed.  

## See Also
[Dialog Data Type](dialog-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)