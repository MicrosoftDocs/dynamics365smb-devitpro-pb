---
title: "ErrorInfo.AddNavigationAction([Text]) Method"
description: "Adds a navigation action for the error."
ms.author: solsen
ms.custom: na
ms.date: 08/02/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.AddNavigationAction([Text]) Method
> **Version**: _Available or changed with runtime version 11.0._

Adds a navigation action for the error.


## Syntax
```AL
 ErrorInfo.AddNavigationAction([Caption: Text])
```
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] Caption*  
&emsp;Type: [Text](../text/text-data-type.md)  
The text string that appears as the caption of the action in the error UI. The string can be a label that is enabled for multilanguage functionality.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remark 

You use the `AddNavigationAction` property to implement a show-it action on the error dialog. For more information about how to develop actionable errors, see [Actionable errors](../../devenv-actionable-errors.md). 


## Example (set the AddNavigationAction property)

```AL

var 
    MyErrorInfo: ErrorInfo;
    TheCustomDimensions: Dictionary of [Text, Text];
begin
    // setup the error info object: Define Message, DetailedMessage etc.

    // setup show-it action(s) for the error info object
    ChangeNotAllowedErrorInfo.PageNo(PAGE::"MyPage");
    ChangeNotAllowedErrorInfo.AddNavigationAction('Some caption');

    Error(MyErrorInfo);
end
```

## See Also

[ErrorInfo Data Type](errorinfo-data-type.md)  
[Actionable errors](../../devenv-actionable-errors.md)  
[User experience guidelines for errors](../../devenv-error-handling-guidelines.md)  
[Error handling](../../devenv-al-error-handling.md)   
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)