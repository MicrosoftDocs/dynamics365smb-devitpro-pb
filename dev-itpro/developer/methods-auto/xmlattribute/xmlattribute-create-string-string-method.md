---
title: "XmlAttribute.Create(Text, Text) Method"
description: "Creates an XmlAttribute node."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# XmlAttribute.Create(Text, Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Creates an XmlAttribute node.


## Syntax
```AL
XmlAttribute :=   XmlAttribute.Create(Name: Text, Value: Text)
```
## Parameters
*Name*  
&emsp;Type: [Text](../text/text-data-type.md)  
The qualified name of the attribute. If the name is of the form {{namespace}}localName, it will be qualified with the given namespace.  

*Value*  
&emsp;Type: [Text](../text/text-data-type.md)  
The value of the attribute.  


## Return Value
*XmlAttribute*  
&emsp;Type: [XmlAttribute](xmlattribute-data-type.md)  
The created XmlAttribute node.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[XmlAttribute Data Type](xmlattribute-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)