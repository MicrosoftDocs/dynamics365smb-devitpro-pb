---
title: "SecretText data type"
description: "Denotes a secret text string, which is non-debuggable."
ms.author: solsen
ms.date: 11/01/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# SecretText Data type
> **Version**: _Available or changed with runtime version 12.0._

Denotes a secret text string, which is non-debuggable.


## Static methods
The following methods are available on the SecretText data type.


|Method name|Description|
|-----------|-----------|
|[SecretStrSubstNo(Text [, SecretText,...])](secrettext-secretstrsubstno-method.md)|Replaces %1, %2, %3... and #1, #2, #3... fields in a string with the values you provide as optional parameters.|

## Instance methods
The following methods are available on instances of the SecretText data type.

|Method name|Description|
|-----------|-----------|
|[IsEmpty()](secrettext-isempty-method.md)|Returns a value indicating whether the secret text does not contain any content.|
|[Unwrap()](secrettext-unwrap-method.md)|Returns the text contained text inside the secret text as a plain text value. This method exists for compatibility reasons and its use is discouraged as it can lead to secret exposure.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  