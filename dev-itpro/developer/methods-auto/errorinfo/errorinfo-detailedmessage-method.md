---
title: "ErrorInfo.DetailedMessage([Text]) Method"
description: "Specifies a detailed error message (not shown to the user)."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.DetailedMessage([Text]) Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies a detailed error message.


## Syntax
```AL
[DetailedMessage := ]  ErrorInfo.DetailedMessage([DetailedMessage: Text])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] DetailedMessage*  
&emsp;Type: [Text](../text/text-data-type.md)  
The detailed message of the ErrorInfo  


## Return Value
*[Optional] DetailedMessage*  
&emsp;Type: [Text](../text/text-data-type.md)  
The current detailed message of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The detailed message is not shown to the end user, but is included in the **Copy details** part of the error dialog. For more information about the **Copy details** part of the error dialog, see [Understanding the error dialog](../../devenv-error-dialog.md).  

You are not required to set a detailed message for error dialogs. But it might be helpful to add more technical information here to help a person who needs to troubleshoot the issue. 

## Example 

```AL
var 
    dimension: Text[30];
    vendorCode: Text[30];
    MyErrorInfo: ErrorInfo;
begin
    // setup the error info object
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
[Understanding the error dialog](../../devenv-error-dialog.md)  
[Error handling](../../devenv-al-error-handling.md)   
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)