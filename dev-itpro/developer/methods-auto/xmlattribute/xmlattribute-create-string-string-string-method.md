---
title: "XmlAttribute.Create(Text, Text, Text) Method"
description: "Creates an XmlAttribute node."
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
# XmlAttribute.Create(Text, Text, Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Creates an XmlAttribute node.


## Syntax
```AL
XmlAttribute :=   XmlAttribute.Create(LocalName: Text, NamespaceUri: Text, Value: Text)
```
## Parameters
*LocalName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The local name of the attribute.
        

*NamespaceUri*  
&emsp;Type: [Text](../text/text-data-type.md)  
The namespace URI of the attribute.
        

*Value*  
&emsp;Type: [Text](../text/text-data-type.md)  
The value of the attribute.  


## Return Value
*XmlAttribute*  
&emsp;Type: [XmlAttribute](xmlattribute-data-type.md)  
The created XmlAttribute node.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlAttribute Data Type](xmlattribute-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)