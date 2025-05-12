---
title: "JsonToken.WriteTo(OutStream) Method"
description: "Serializes and writes the JSON data of the JsonToken to a given OutStream object."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonToken.WriteTo(OutStream) Method
> **Version**: _Available or changed with runtime version 1.0._

Serializes and writes the JSON data of the JsonToken to a given OutStream object.


## Syntax
```AL
[Ok := ]  JsonToken.WriteTo(Data: OutStream)
```
## Parameters
*JsonToken*  
&emsp;Type: [JsonToken](jsontoken-data-type.md)  
An instance of the [JsonToken](jsontoken-data-type.md) data type.  

*Data*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
The OutStream object to which the JSON data will be read.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the read was successful; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[JsonToken Data Type](jsontoken-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)