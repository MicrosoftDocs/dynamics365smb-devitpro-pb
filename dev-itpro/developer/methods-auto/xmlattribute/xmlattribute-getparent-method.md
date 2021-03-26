---
title: "XmlAttribute.GetParent Method"
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
# XmlAttribute.GetParent Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the parent XmlElement of this node.


## Syntax
```
[Ok := ]  XmlAttribute.GetParent(var Parent: XmlElement)
```
## Parameters
*XmlAttribute*
&emsp;Type: [XmlAttribute](xmlattribute-data-type.md)
An instance of the [XmlAttribute](xmlattribute-data-type.md) data type.

*Parent*  
&emsp;Type: [XmlElement](../xmlelement/xmlelement-data-type.md)  
The parent XmlElement of this node.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlAttribute Data Type](xmlattribute-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)