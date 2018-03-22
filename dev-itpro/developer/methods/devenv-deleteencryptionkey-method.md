---
title: "DELETEENCRYPTIONKEY Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-financials"
ms.assetid: 7dea6cb3-a530-4918-8726-d3316cfc2be1
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# DELETEENCRYPTIONKEY Method
Deletes the encryption key for the current tenant.  

> [!IMPORTANT]  
>  Use the System Restore permission set in the client to allow importing the encryption key.  

## Syntax  

```  
DELETEENCRYPTIONKEY()  
```  

## Example  
 This code example checks if encryption is configured for the tenant using the [ENCRYPTIONENABLED](devenv-encryptionenabled-method.md) method and if so, it performs the deletion of the encryption key.  

```  
IF NOT ENCRYPTIONENABLED THEN  
  ERROR('Encryption has not been enabled.');  
  DELETEENCRYPTIONKEY();  

```  

## See Also  
    
 [AL Reference Guide](../devenv-al-reference-guide.md)
