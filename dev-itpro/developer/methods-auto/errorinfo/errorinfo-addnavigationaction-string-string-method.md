---
title: "ErrorInfo.AddNavigationAction([Text] [, Text]) Method"
description: "Adds a navigation action for the error."
ms.author: solsen
ms.custom: na
ms.date: 01/03/2024
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.AddNavigationAction([Text] [, Text]) Method
> **Version**: _Available or changed with runtime version 12.0._

Adds a navigation action for the error.


## Syntax
```AL
 ErrorInfo.AddNavigationAction([Caption: Text] [, Description: Text])
```
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] Caption*  
&emsp;Type: [Text](../text/text-data-type.md)  
The text string that appears as the caption of the action in the error UI. The string can be a label that is enabled for multilanguage functionality.  

*[Optional] Description*  
&emsp;Type: [Text](../text/text-data-type.md)  
The text that appears as the tooltip of the action in the error UI.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The semantics of this method is the same as the version without a Description parameter. See [ErrorInfo.AddNavigationAction([Text])](./errorinfo-addnavigationaction-string-method.md) for more information.

## See Also

[ErrorInfo Data Type](errorinfo-data-type.md)  
[Actionable errors](../../devenv-actionable-errors.md)  
[User experience guidelines for errors](../../devenv-error-handling-guidelines.md)  
[Error handling](../../devenv-al-error-handling.md)   
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)