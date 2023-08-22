---
title: "XmlElement.GetChildElements(Text) Method"
description: "Gets a list containing the child elements for this element, in document order."
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
# XmlElement.GetChildElements(Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a list containing the child elements for this element, in document order.


## Syntax
```AL
ChildElements :=   XmlElement.GetChildElements(Name: Text)
```
## Parameters
*XmlElement*  
&emsp;Type: [XmlElement](xmlelement-data-type.md)  
An instance of the [XmlElement](xmlelement-data-type.md) data type.  

*Name*  
&emsp;Type: [Text](../text/text-data-type.md)  
The fully qualified name of the elements to retrieve.  


## Return Value
*ChildElements*  
&emsp;Type: [XmlNodeList](../xmlnodelist/xmlnodelist-data-type.md)  
A list containing the child elements for this element, in document order.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlElement Data Type](xmlelement-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)