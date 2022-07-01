---
title: "ErrorInfo.CustomDimensions([Dictionary of [Text, Text]]) Method"
description: "Set of additional dimensions, specified as a dictionary that relates to the error."
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
# ErrorInfo.CustomDimensions([Dictionary of [Text, Text]]) Method
> **Version**: _Available or changed with runtime version 8.0._

Set of additional dimensions, specified as a dictionary that relates to the error.


## Syntax
```AL
[CustomDimensions := ]  ErrorInfo.CustomDimensions([CustomDimensions: Dictionary of [Text, Text]])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] CustomDimensions*  
&emsp;Type: [Dictionary of [Text, Text]](../dictionary/dictionary-data-type.md)  
The custom dimensions of the ErrorInfo  


## Return Value
*[Optional] CustomDimensions*  
&emsp;Type: [Dictionary of [Text, Text]](../dictionary/dictionary-data-type.md)  
The current custom dimensions of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also

[Collecting Errors](../../devenv-error-collection.md)  
[ErrorInfo Data Type](errorinfo-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)