---
title: "System.CreateEncryptionKey Method"
description: "Creates an encryption key for the current tenant."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.CreateEncryptionKey Method
> **Version**: _Available or changed with runtime version 1.0._

Creates an encryption key for the current tenant.


## Syntax
```AL
[Ok := ]  System.CreateEncryptionKey()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If a key already exists, the following error will be displayed: **Unable to create a new encryption key. An encryption key already exists**.  

## Example  

This code example creates an encryption key for the current tenant. It uses the [EncryptionEnabled](../../methods-auto/system/system-encryptionenabled-method.md) method to perform a check.  

```al
if not EncryptionEnabled then  
        CreateEncryptionKey();  
```

## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)