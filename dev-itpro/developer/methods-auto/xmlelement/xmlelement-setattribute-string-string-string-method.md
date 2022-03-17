---
title: "XmlElement.SetAttribute(String, String, String) Method"
description: "Sets the value of the specified attribute or create it if is not part of the element's attribute collection."
ms.author: solsen
ms.custom: na
ms.date: 03/17/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# XmlElement.SetAttribute(String, String, String) Method
> **Version**: _Available or changed with runtime version 1.0._

Sets the value of the specified attribute or create it if is not part of the element's attribute collection.


## Syntax
```AL
 XmlElement.SetAttribute(LocalName: String, NamespaceUri: String, Value: String)
```
## Parameters
*XmlElement*  
&emsp;Type: [XmlElement](xmlelement-data-type.md)  
An instance of the [XmlElement](xmlelement-data-type.md) data type.  

*LocalName*  
&emsp;Type: [String](../text/text-data-type.md)  
The local name of the attribute to set.
        

*NamespaceUri*  
&emsp;Type: [String](../text/text-data-type.md)  
The namespace URI of the attribute to set.
        

*Value*  
&emsp;Type: [String](../text/text-data-type.md)  
The value to set for the attribute.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlElement Data Type](xmlelement-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)