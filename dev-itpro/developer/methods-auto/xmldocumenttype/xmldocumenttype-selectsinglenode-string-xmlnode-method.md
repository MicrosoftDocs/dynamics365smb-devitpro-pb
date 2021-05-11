---
title: "XmlDocumentType.SelectSingleNode Method"
description: "Selects the first XmlNode that matches the XPath expression."
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
# XmlDocumentType.SelectSingleNode Method
> **Version**: _Available or changed with runtime version 1.0._

Selects the first XmlNode that matches the XPath expression.


## Syntax
```
[Ok := ]  XmlDocumentType.SelectSingleNode(XPath: String, var Node: XmlNode)
```
## Parameters
*XmlDocumentType*  
&emsp;Type: [XmlDocumentType](xmldocumenttype-data-type.md)  
An instance of the [XmlDocumentType](xmldocumenttype-data-type.md) data type.

*XPath*  
&emsp;Type: [String](../string/string-data-type.md)  
The XPath expression.  
*Node*  
&emsp;Type: [XmlNode](../xmlnode/xmlnode-data-type.md)  
The first XmlNode that matches the XPath query.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlDocumentType Data Type](xmldocumenttype-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)