---
title: "XmlDeclaration.Create(Text, Text, Text) Method"
description: "Creates an XmlDeclaration node."
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
# XmlDeclaration.Create(Text, Text, Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Creates an XmlDeclaration node.


## Syntax
```AL
XmlDeclaration :=   XmlDeclaration.Create(Version: Text, Encoding: Text, Standalone: Text)
```
## Parameters
*Version*  
&emsp;Type: [Text](../text/text-data-type.md)  
The version of the XML, usually "1.0".
        

*Encoding*  
&emsp;Type: [Text](../text/text-data-type.md)  
The encoding for the XML document.
        

*Standalone*  
&emsp;Type: [Text](../text/text-data-type.md)  
A string containing "yes" or "no" that specifies whether the XML is standalone or requires external entities to be resolved.  


## Return Value
*XmlDeclaration*  
&emsp;Type: [XmlDeclaration](xmldeclaration-data-type.md)  
The created XmlDeclaration node.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlDeclaration Data Type](xmldeclaration-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)