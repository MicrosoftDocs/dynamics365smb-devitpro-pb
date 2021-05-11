---
title: "XmlDocument.GetDescendantElements Method"
description: "Gets a list containing the descendant elements for this document, in document order."
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
# XmlDocument.GetDescendantElements Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a list containing the descendant elements for this document, in document order.


## Syntax
```
DescendantElements :=   XmlDocument.GetDescendantElements(LocalName: String, NamespaceUri: String)
```
## Parameters
*XmlDocument*  
&emsp;Type: [XmlDocument](xmldocument-data-type.md)  
An instance of the [XmlDocument](xmldocument-data-type.md) data type.

*LocalName*  
&emsp;Type: [String](../string/string-data-type.md)  
The local name of the elements to retrieve.
        
*NamespaceUri*  
&emsp;Type: [String](../string/string-data-type.md)  
The namespace URI of the elements to retrieve.  


## Return Value
*DescendantElements*  
&emsp;Type: [XmlNodeList](../xmlnodelist/xmlnodelist-data-type.md)  
A list containing the descendant elements for this document, in document order.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlDocument Data Type](xmldocument-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)