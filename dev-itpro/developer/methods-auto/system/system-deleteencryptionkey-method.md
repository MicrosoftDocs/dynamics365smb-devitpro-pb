---
title: "System.DeleteEncryptionKey Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.DeleteEncryptionKey Method
> **Version**: _Available from runtime version 1.0._

Deletes an encryption key for the current tenant.


## Syntax
```
 System.DeleteEncryptionKey()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

This code example checks if encryption is configured for the tenant using the [EncryptionEnabled](../../methods-auto/system/system-encryptionenabled-method.md) method and if so, it performs the deletion of the encryption key.  

```al
if not EncryptionEnabled then  
  Error('Encryption has not been enabled.');  
  DeleteEncryptionKey();  
```

## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)