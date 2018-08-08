---
title: "Replace Method"
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
# Replace Method
Replaces the value of the property with the given key with the new value.

## Syntax
```
[Ok := ]  JsonObject.Replace(Key: String, Value: JsonObject)
```
## Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-data-type.md)  
An instance of the [JsonObject](jsonobject-data-type.md) data type.  
*Key*  
&emsp;Type: [String](string-data-type.md)  
  
*Value*  
&emsp;Type: [JsonObject](jsonobject-data-type.md)  
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonObject Data Type](jsonobject-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)