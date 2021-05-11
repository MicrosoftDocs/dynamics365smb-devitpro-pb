---
title: "XmlNamespaceManager.NameTable Method"
description: "Gets or sets the XmlNameTable associated with this object."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# XmlNamespaceManager.NameTable Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the XmlNameTable associated with this object.


## Syntax
```
[Value := ]  XmlNamespaceManager.NameTable([NewValue: XmlNameTable])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*XmlNamespaceManager*  
&emsp;Type: [XmlNamespaceManager](xmlnamespacemanager-data-type.md)  
An instance of the [XmlNamespaceManager](xmlnamespacemanager-data-type.md) data type.

*NewValue*  
&emsp;Type: [XmlNameTable](../xmlnametable/xmlnametable-data-type.md)  
The new XmlNameTable to associate with this object. Setting the NameTable will reset the state of the XmlNamespaceManager.  


## Return Value
*Value*  
&emsp;Type: [XmlNameTable](../xmlnametable/xmlnametable-data-type.md)  
The XmlNameTable associated with this object.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlNamespaceManager Data Type](xmlnamespacemanager-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)