---
title: "XmlDocumentType.Create Method"
description: "Creates an XmlDocumentType node."
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
# XmlDocumentType.Create Method
> **Version**: _Available or changed with runtime version 1.0._

Creates an XmlDocumentType node.


## Syntax
```
XmlDocumentType :=   XmlDocumentType.Create(Name: String, PublicId: String)
```
## Parameters
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
A string that contains the qualified name of the DTD, which is the same as the qualified name of the root element of the XML document.
        
*PublicId*  
&emsp;Type: [String](../string/string-data-type.md)  
A string that contains the public identifier of an external public DTD.  


## Return Value
*XmlDocumentType*  
&emsp;Type: [XmlDocumentType](xmldocumenttype-data-type.md)  
The created XmlDocumentType node.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlDocumentType Data Type](xmldocumenttype-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)