---
title: "JsonObject.WriteToYaml(var Text) Method"
description: "Serializes and writes the JsonObject as YAML to a given Text object."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonObject.WriteToYaml(var Text) Method
> **Version**: _Available or changed with runtime version 14.3._

Serializes and writes the JsonObject as YAML to a given Text object.


## Syntax
```AL
[Ok := ]  JsonObject.WriteToYaml(var String: Text)
```
## Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-data-type.md)  
An instance of the [JsonObject](jsonobject-data-type.md) data type.  

*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
The Text object to which the YAML data will be written.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the write was successful; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[JsonObject data type](jsonobject-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)