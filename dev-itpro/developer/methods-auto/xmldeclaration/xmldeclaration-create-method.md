---
title: "XmlDeclaration.Create Method"
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
# XmlDeclaration.Create Method
> **Version**: _Available or changed with runtime version 1.0._

Creates an XmlDeclaration node.


## Syntax
```
XmlDeclaration :=   XmlDeclaration.Create(Version: String, Encoding: String, Standalone: String)
```
## Parameters
*Version*  
&emsp;Type: [String](../string/string-data-type.md)  
The version of the XML, usually "1.0".
        
*Encoding*  
&emsp;Type: [String](../string/string-data-type.md)  
The encoding for the XML document.
        
*Standalone*  
&emsp;Type: [String](../string/string-data-type.md)  
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