---
title: "XmlDocumentType.AddBeforeSelf Method"
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
# XmlDocumentType.AddBeforeSelf Method
> **Version**: _Available from runtime version 1.0._

Adds the specified content immediately before this node.


## Syntax
```
[Ok := ]  XmlDocumentType.AddBeforeSelf(Content: Any,...)
```
## Parameters
*XmlDocumentType*
&emsp;Type: [XmlDocumentType](xmldocumenttype-data-type.md)
An instance of the [XmlDocumentType](xmldocumenttype-data-type.md) data type.

*Content*  
&emsp;Type: [Any](../any/any-data-type.md)  
The content to add before this node.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlDocumentType Data Type](xmldocumenttype-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)