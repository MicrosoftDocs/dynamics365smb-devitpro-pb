---
title: "XmlNodeList.Get Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# XmlNodeList.Get Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a node at the given index.


## Syntax
```
[Ok := ]  XmlNodeList.Get(Index: Integer, var Node: XmlNode)
```
## Parameters
*XmlNodeList*
&emsp;Type: [XmlNodeList](xmlnodelist-data-type.md)
An instance of the [XmlNodeList](xmlnodelist-data-type.md) data type.

*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based index into the list of nodes.
        
*Node*  
&emsp;Type: [XmlNode](../xmlnode/xmlnode-data-type.md)  
The XmlNode with the specified index in the list.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if a node is found at the given index, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlNodeList Data Type](xmlnodelist-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)