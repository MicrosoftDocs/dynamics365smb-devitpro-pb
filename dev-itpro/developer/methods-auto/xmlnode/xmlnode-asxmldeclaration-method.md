---
title: "XmlNode.AsXmlDeclaration Method"
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
# XmlNode.AsXmlDeclaration Method
> **Version**: _Available or changed with runtime version 1.0._

Converts the node to an XmlDeclaration node. The operation will fail if the node is not an XmlDeclaration.


## Syntax
```
XmlDeclaration :=   XmlNode.AsXmlDeclaration()
```

## Parameters
*XmlNode*
&emsp;Type: [XmlNode](xmlnode-data-type.md)
An instance of the [XmlNode](xmlnode-data-type.md) data type.

## Return Value
*XmlDeclaration*
&emsp;Type: [XmlDeclaration](../xmldeclaration/xmldeclaration-data-type.md)
An XmlDeclaration value that references the current XmlNode.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlNode Data Type](xmlnode-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)