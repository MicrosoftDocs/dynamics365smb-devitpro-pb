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
Gets the atomized string with the specified value.

## Syntax
```
[Ok := ]  XmlNameTable.Get(Key: String, var Result: Text)
```
## Parameters
*XmlNameTable*  
&emsp;Type: [XmlNameTable](xmlnametable-data-type.md)  
An instance of the [XmlNameTable](xmlnametable-data-type.md) data type.  
*Key*  
&emsp;Type: [String](string-data-type.md)  
The name to find.  
*Result*  
&emsp;Type: [Text](text-data-type.md)  
The atomized string object if the string has been atomized.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlNameTable Data Type](xmlnametable-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)