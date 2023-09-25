---
title: "SecretText.SecretStrSubstNo(Text [, SecretText,...]) Method"
description: "Replaces %1, %2, %3..."
ms.author: solsen
ms.custom: na
ms.date: 08/02/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# SecretText.SecretStrSubstNo(Text [, SecretText,...]) Method
> **Version**: _Available or changed with runtime version 12.0._

Replaces %1, %2, %3... and #1, #2, #3... fields in a string with the values you provide as optional parameters.


## Syntax
```AL
NewSecretText :=   SecretText.SecretStrSubstNo(String: Text [, Value1: SecretText,...])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
A string containing '#' and/or '%' fields.  

*[Optional] Value1*  
&emsp;Type: [SecretText](secrettext-data-type.md)  
One or more values (expressions) that you want to insert into String. You can specify up to 10 values.  


## Return Value
*NewSecretText*  
&emsp;Type: [SecretText](secrettext-data-type.md)  
Returns a new SecretText with the provided values inserted into the specified string.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[SecretText Data Type](secrettext-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)