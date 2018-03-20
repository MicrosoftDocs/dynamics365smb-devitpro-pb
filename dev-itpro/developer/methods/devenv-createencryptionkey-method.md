---
title: "CREATEENCRYPTIONKEY Method"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 27269343-8b5a-47b8-aa55-bbf2beb1c355
author: SusanneWindfeldPedersen
---

 

# CREATEENCRYPTIONKEY Method
Creates an encryption key for the current tenant.  

## Syntax  

```  
CREATEENCRYPTIONKEY()  
```  

## Return Value  
 Type: Boolean  

 **True** if the encryption key was created; otherwise, **false**.  

 If you omit this optional return value and the encryption key cannot be created successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  

## Exceptions  
 If a key already exists, the following error will be displayed: **Unable to create a new encryption key. An encryption key already exists**.  

## Example  
 This code example creates an encryption key for the current tenant. It uses the [ENCRYPTIONENABLED](devenv-encryptionenabled-method.md) method to perform a check.  

```  
IF NOT ENCRYPTIONENABLED THEN  
        CREATEENCRYPTIONKEY();  
```  

## See Also  
    
 [AL Reference Guide](../devenv-al-reference-guide.md)
