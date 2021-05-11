---
title: "XmlDocument.AddAfterSelf Method"
description: "Adds the specified content immediately after this node."
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
# XmlDocument.AddAfterSelf Method
> **Version**: _Available or changed with runtime version 1.0._

Adds the specified content immediately after this node.


## Syntax
```
[Ok := ]  XmlDocument.AddAfterSelf(Content: Any,...)
```
## Parameters
*XmlDocument*  
&emsp;Type: [XmlDocument](xmldocument-data-type.md)  
An instance of the [XmlDocument](xmldocument-data-type.md) data type.

*Content*  
&emsp;Type: [Any](../any/any-data-type.md)  
The content to add after this node.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlDocument Data Type](xmldocument-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)