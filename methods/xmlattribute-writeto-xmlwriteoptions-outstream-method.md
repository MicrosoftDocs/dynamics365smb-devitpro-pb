---
title: "WriteTo Method"
ms.author: solsen
ms.custom: na
ms.date: 07/27/2018
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
# WriteTo Method
Serializes and saves the current node to the given variable.

## Syntax
```
[Ok := ]  XmlAttribute.WriteTo(WriteOptions: XmlWriteOptions, OutStream: OutStream)
```
## Parameters
*XmlAttribute*  
&emsp;Type: [XmlAttribute](xmlattribute-data-type.md)  
An instance of the [XmlAttribute](xmlattribute-data-type.md) data type.  
*WriteOptions*  
&emsp;Type: [XmlWriteOptions](xmlwriteoptions-data-type.md)  
Specifies options for customizing how the node is serialized.  
*OutStream*  
&emsp;Type: [OutStream](outstream-data-type.md)  
The OutStream to which you want to save the serialized representation of the node.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlAttribute Data Type](xmlattribute-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)