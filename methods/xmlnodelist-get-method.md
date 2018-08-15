---
title: "Get Method"
ms.author: solsen
ms.custom: na
ms.date: 07/30/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Get Method
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
&emsp;Type: [Integer](integer-data-type.md)  
The one-based index into the list of nodes.  
*Node*  
&emsp;Type: [XmlNode](xmlnode-data-type.md)  
The XmlNode with the specified index in the list.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlNodeList Data Type](xmlnodelist-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)