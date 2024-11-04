---
title: "SecretText.IsEmpty() Method"
description: "Returns a value indicating whether the secret text does not contain any content."
ms.author: solsen
ms.date: 11/01/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# SecretText.IsEmpty() Method
> **Version**: _Available or changed with runtime version 12.0._

Returns a value indicating whether the secret text does not contain any content.


## Syntax
```AL
Ok :=   SecretText.IsEmpty()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*SecretText*  
&emsp;Type: [SecretText](secrettext-data-type.md)  
An instance of the [SecretText](secrettext-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the secret text does not contain any content, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[SecretText Data Type](secrettext-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
