---
title: "XmlWriteOptions.PreserveWhitespace Method"
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
# XmlWriteOptions.PreserveWhitespace Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets a value that indicates whether insignificant white space should be preserved during serialization.


## Syntax
```
[Value := ]  XmlWriteOptions.PreserveWhitespace([NewValue: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*XmlWriteOptions*
&emsp;Type: [XmlWriteOptions](xmlwriteoptions-data-type.md)
An instance of the [XmlWriteOptions](xmlwriteoptions-data-type.md) data type.

*NewValue*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The new value of the flag.  


## Return Value
*Value*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if insignificant white spaces should be preserved during serialization, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlWriteOptions Data Type](xmlwriteoptions-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)