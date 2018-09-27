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
Serializes and writes the JSON data of the JsonValue to a given object.

## Syntax
```
[Ok := ]  JsonValue.WriteTo(var Data: Text)
```
## Parameters
*JsonValue*  
&emsp;Type: [JsonValue](jsonvalue-data-type.md)  
An instance of the [JsonValue](jsonvalue-data-type.md) data type.  

*Data*  
&emsp;Type: [Text](text-data-type.md)  
The Text object to which the JSON data will be written.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
**true** if the read was successful; otherwise, **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonValue Data Type](jsonvalue-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)