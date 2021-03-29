---
title: "XmlNode.ReplaceWith Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# XmlNode.ReplaceWith Method
> **Version**: _Available or changed with runtime version 1.0._

Replaces this node with the specified content.


## Syntax
```
[Ok := ]  XmlNode.ReplaceWith(Node: Any,...)
```
## Parameters
*XmlNode*
&emsp;Type: [XmlNode](xmlnode-data-type.md)
An instance of the [XmlNode](xmlnode-data-type.md) data type.

*Node*  
&emsp;Type: [Any](../any/any-data-type.md)  
The content with which to replace the current node.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlNode Data Type](xmlnode-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)