---
title: "ErrorInfo.PageNo([Integer]) Method"
description: "Specifies the page number that the error relates to."
ms.author: solsen
ms.custom: na
ms.date: 08/24/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.PageNo([Integer]) Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies the page number that the error relates to.


## Syntax
```AL
[PageNo := ]  ErrorInfo.PageNo([PageNo: Integer])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] PageNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The page number of the ErrorInfo  


## Return Value
*[Optional] PageNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The current page number of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remark 

You use the `PageNo` property when also using a show-it action with the `AddNavigationAction` property. The `PageNo` then specifies where the action takes the user when activated.

## Example (set the PageNo property)

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
[Error handling](../../devenv-al-error-handling.md)   
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)