---
title: "WriteTo Method"
ms.author: solsen
ms.custom: na
ms.date: 09/27/2018
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
Serializes and writes the JSON data of the JsonToken to a given Text object.

## Syntax
```
[Ok := ]  JsonToken.WriteTo(var String: Text)
```
## Parameters
*JsonToken*  
&emsp;Type: [JsonToken](jsontoken-data-type.md)  
An instance of the [JsonToken](jsontoken-data-type.md) data type.  

*String*  
&emsp;Type: [Text](text-data-type.md)  
The Text object to which the JSON data will be read.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
**true** if the read was successful; otherwise, **false**  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonToken Data Type](jsontoken-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)