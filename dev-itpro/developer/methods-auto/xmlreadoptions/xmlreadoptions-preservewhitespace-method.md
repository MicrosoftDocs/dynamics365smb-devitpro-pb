---
title: "XmlReadOptions.PreserveWhitespace Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# XmlReadOptions.PreserveWhitespace Method
Gets or sets a value that indicates whether insignificant white space should be preserved during parsing.


## Syntax
```
[Value := ]  XmlReadOptions.PreserveWhitespace([NewValue: Boolean])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*XmlReadOptions*  
&emsp;Type: [XmlReadOptions](xmlreadoptions-data-type.md)  
An instance of the [XmlReadOptions](xmlreadoptions-data-type.md) data type.  

*NewValue*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The new value of the flag.  


## Return Value
*Value*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if insignificant white spaces are preserved during parsing, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlReadOptions Data Type](xmlreadoptions-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)