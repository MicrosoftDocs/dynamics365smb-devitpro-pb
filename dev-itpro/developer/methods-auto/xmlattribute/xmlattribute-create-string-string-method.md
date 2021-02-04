---
title: "XmlAttribute.Create Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# XmlAttribute.Create Method
> **Version**: _Available from runtime version 1.0._

Creates an XmlAttribute node.


## Syntax
```
XmlAttribute :=   XmlAttribute.Create(Name: String, Value: String)
```
## Parameters
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The qualified name of the attribute. If the name is of the form {{namespace}}localName, it will be qualified with the given namespace.
        
*Value*  
&emsp;Type: [String](../string/string-data-type.md)  
The value of the attribute.  


## Return Value
*XmlAttribute*
&emsp;Type: [XmlAttribute](xmlattribute-data-type.md)
The created XmlAttribute node.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlAttribute Data Type](xmlattribute-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)