---
title: "JsonValue.WriteTo(var Text) Method"
description: "Serializes and writes the JSON data of the JsonValue to a given object."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonValue.WriteTo(var Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Serializes and writes the JSON data of the JsonValue to a given object.


## Syntax
```AL
[Ok := ]  JsonValue.WriteTo(var Data: Text)
```
## Parameters
*JsonValue*  
&emsp;Type: [JsonValue](jsonvalue-data-type.md)  
An instance of the [JsonValue](jsonvalue-data-type.md) data type.  

*Data*  
&emsp;Type: [Text](../text/text-data-type.md)  
The Text object to which the JSON data will be written.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the read was successful; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonValue Data Type](jsonvalue-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)