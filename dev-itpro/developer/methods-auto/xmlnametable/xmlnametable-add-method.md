---
title: "XmlNameTable.Add(String) Method"
description: "Atomizes the specified string and adds it to the XmlNameTable."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# XmlNameTable.Add(String) Method
> **Version**: _Available or changed with runtime version 1.0._

Atomizes the specified string and adds it to the XmlNameTable.


## Syntax
```AL
[AddedKey := ]  XmlNameTable.Add(Key: String)
```
## Parameters
*XmlNameTable*  
&emsp;Type: [XmlNameTable](xmlnametable-data-type.md)  
An instance of the [XmlNameTable](xmlnametable-data-type.md) data type.  

*Key*  
&emsp;Type: [String](../string/string-data-type.md)  
The string to add.  


## Return Value
*[Optional] AddedKey*  
&emsp;Type: [String](../string/string-data-type.md)  
The new atomized string or the existing one if it already exists


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlNameTable Data Type](xmlnametable-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)