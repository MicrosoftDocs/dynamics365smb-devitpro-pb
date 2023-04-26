---
title: "CREATEENCRYPTIONKEY"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 27269343-8b5a-47b8-aa55-bbf2beb1c355
caps.latest.revision: 7
---
# CREATEENCRYPTIONKEY
Creates an encryption key for the current [!INCLUDE[navnow](includes/navnow_md.md)] tenant.  

## Syntax  

```  
CREATEENCRYPTIONKEY()  
```  

## Return Value  
 Type: Boolean  

 **true** if the encryption key was created; otherwise, **false**.  

 If you omit this optional return value and the encryption key cannot be created successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  

## Exceptions  
 If a key already exists, the following error will be displayed: **Unable to create a new encryption key. An encryption key already exists**.  

## Example  
 This code example creates an encryption key for the current tenant. It uses the [ENCRYPTIONENABLED](ENCRYPTIONENABLED.md) function to perform a check.  

```  
IF NOT ENCRYPTIONENABLED THEN  
        CREATEENCRYPTIONKEY();  
```  

## See Also  
 [System](System.md)   
 [Technical Reference](Technical-Reference.md)   
 [C/SIDE Reference Guide](C-SIDE-Reference-Guide.md)
