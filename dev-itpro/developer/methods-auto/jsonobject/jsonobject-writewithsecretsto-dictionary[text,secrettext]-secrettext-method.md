---
title: "JsonObject.WriteWithSecretsTo(Dictionary of [Text, SecretText], var SecretText) Method"
description: "Replaces the placeholder values based on their paths with the provided secrets and then serializes and writes the content of the JsonObject to a SecretText."
ms.author: solsen
ms.date: 06/10/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonObject.WriteWithSecretsTo(Dictionary of [Text, SecretText], var SecretText) Method
> **Version**: _Available or changed with runtime version 15.1._

Replaces the placeholder values based on their paths with the provided secrets and then serializes and writes the content of the JsonObject to a SecretText.


## Syntax
```AL
[Ok := ]  JsonObject.WriteWithSecretsTo(Secrets: Dictionary of [Text, SecretText], var Result: SecretText)
```
## Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-data-type.md)  
An instance of the [JsonObject](jsonobject-data-type.md) data type.  

*Secrets*  
&emsp;Type: [Dictionary of [Text, SecretText]](../dictionary/dictionary-data-type.md)  
A mapping from paths in the JPath format to the secrets, which will replace the values in these paths.  

*Result*  
&emsp;Type: [SecretText](../secrettext/secrettext-data-type.md)  
The SecretText object to which the JSON data will be written.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the write was successful; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonObject data type](jsonobject-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)