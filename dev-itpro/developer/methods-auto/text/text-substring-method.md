---
title: "Text.Substring Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# Text.Substring Method
> **Version**: _Available or changed with runtime version 1.0._

Retrieves a substring from this instance.


## Syntax
```
Substring :=   Text.Substring(StartIndex: Integer [, Count: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Text*
&emsp;Type: [Text](text-data-type.md)
An instance of the [Text](text-data-type.md) data type.

*StartIndex*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based starting character position of a substring in this instance.
        
*Count*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of characters in the substring.  


## Return Value
*Substring*
&emsp;Type: [Text](text-data-type.md)
The substring extracted from this instance.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)