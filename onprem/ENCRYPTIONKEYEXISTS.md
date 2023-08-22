---
title: "ENCRYPTIONKEYEXISTS"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c31eb42b-c3a4-4592-b712-a24bb6141ccc
caps.latest.revision: 5
---
# ENCRYPTIONKEYEXISTS
Checks whether an encryption key for the current tenant is present on the server tenant.  

## Syntax  

```  
Bool ENCRYPTIONKEYEXISTS()  
```  

## Property Value/Return Value  
 Value: Boolean  

 Returns **true** if the encryption key exists, otherwise **false**.  

## Example  
 This code example performs checks to determine if an encryption key already exists.  

```  
IF ENCRYPTIONENABLED THEN  
        IF ENCRYPTIONKEYEXISTS THEN  
          MESSAGE('Encryption has been enabled and the encryption key is present in this server instance')  
        ELSE  
          MESSAGE('Encryption has been enabled but the encryption key is not present on this server instance')  
      ELSE  
        MESSAGE('Encryption has not been enabled')  
```  

## See Also  
 [System](System.md)   
 [Technical Reference](Technical-Reference.md)   
 [C/SIDE Reference Guide](C-SIDE-Reference-Guide.md)
