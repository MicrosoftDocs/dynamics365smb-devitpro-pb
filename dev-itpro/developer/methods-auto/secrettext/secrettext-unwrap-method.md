---
title: "SecretText.Unwrap() Method"
description: "Returns the text contained text inside the secret text as a plain text value."
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
# SecretText.Unwrap() Method
> **Version**: _Available or changed with runtime version 12.0._

Returns the text contained text inside the secret text as a plain text value. This method exists for compatibility reasons and its use is discouraged as it can lead to secret exposure.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
UnwrappedText :=   SecretText.Unwrap()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*SecretText*  
&emsp;Type: [SecretText](secrettext-data-type.md)  
An instance of the [SecretText](secrettext-data-type.md) data type.  

## Return Value
*UnwrappedText*  
&emsp;Type: [Text](../text/text-data-type.md)  
The text contained inside the secret text.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[SecretText Data Type](secrettext-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)