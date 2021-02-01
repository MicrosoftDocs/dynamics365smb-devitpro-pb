---
title: "XmlDeclaration.WriteTo Method"
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
# XmlDeclaration.WriteTo Method
> **Version**: _Available from runtime version 1.0._

Serializes and saves the current node to the given variable.


## Syntax
```
[Ok := ]  XmlDeclaration.WriteTo(WriteOptions: XmlWriteOptions, OutStream: OutStream)
```
## Parameters
*XmlDeclaration*
&emsp;Type: [XmlDeclaration](xmldeclaration-data-type.md)
An instance of the [XmlDeclaration](xmldeclaration-data-type.md) data type.

*WriteOptions*  
&emsp;Type: [XmlWriteOptions](../xmlwriteoptions/xmlwriteoptions-data-type.md)  
Specifies options for customizing how the node is serialized.
        
*OutStream*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
The OutStream to which you want to save the serialized representation of the node.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlDeclaration Data Type](xmldeclaration-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)