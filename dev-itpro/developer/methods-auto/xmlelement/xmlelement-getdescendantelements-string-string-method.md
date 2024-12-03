---
title: "XmlElement.GetDescendantElements(Text, Text) Method"
description: "Gets a list containing the descendant elements for this element, in document order."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# XmlElement.GetDescendantElements(Text, Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a list containing the descendant elements for this element, in document order.


## Syntax
```AL
DescendantElements :=   XmlElement.GetDescendantElements(LocalName: Text, NamespaceUri: Text)
```
## Parameters
*XmlElement*  
&emsp;Type: [XmlElement](xmlelement-data-type.md)  
An instance of the [XmlElement](xmlelement-data-type.md) data type.  

*LocalName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The local name of the elements to retrieve.  

*NamespaceUri*  
&emsp;Type: [Text](../text/text-data-type.md)  
The namespace URI of the elements to retrieve.  


## Return Value
*DescendantElements*  
&emsp;Type: [XmlNodeList](../xmlnodelist/xmlnodelist-data-type.md)  
A list containing the descendant elements for this element, in document order.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[XmlElement Data Type](xmlelement-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)