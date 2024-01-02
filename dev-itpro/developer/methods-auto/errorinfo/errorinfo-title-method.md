---
title: "ErrorInfo.Title([Text]) Method"
description: "Specifies the title of the error."
ms.author: solsen
ms.custom: na
ms.date: 02/08/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.Title([Text]) Method
> **Version**: _Available or changed with runtime version 11.0._

Specifies the title of the error.


## Syntax
```AL
[Title := ]  ErrorInfo.Title([Title: Text])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] Title*  
&emsp;Type: [Text](../text/text-data-type.md)  
The title of the ErrorInfo  


## Return Value
*[Optional] Title*  
&emsp;Type: [Text](../text/text-data-type.md)  
The current title of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Set the **Title** property on error dialogs that are presented to the user to provide a more informative issue description. For advice on how to use the title to describe what’s wrong and enable the user to quickly scan the meaning of the error, see [User experience guidelines for errors](../../devenv-error-handling-guidelines.md#error-message-titles).  

You aren't required to set a title for error dialogs. For example, you might not want to add it for validation error messages. For more information, see
[Error message best practices - what to say?](../../devenv-error-handling-guidelines.md#error_message_best_practices).


## Example 

```AL
var 
    dimension: Text[30];
    vendorCode: Text[30];
    MyErrorInfo: ErrorInfo;
begin
    // set up the error info object
    MyErrorInfo.Title('The line dimension value isn''t valid');
    MyErrorInfo.Message(
        StrSubstNo('The dimension value must be blank for the dimension %1 for Vendor %2', dimension, vendorCode)
    );
    MyErrorInfo.DetailedMessage('Add some text to help the person troubleshooting this error.');
    // maybe set more properties

    Error(MyErrorInfo);
end
```

## See Also

[ErrorInfo Data Type](errorinfo-data-type.md)  
[User experience guidelines for errors](../../devenv-error-handling-guidelines.md)  
[AL error handling](../../devenv-al-error-handling.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
