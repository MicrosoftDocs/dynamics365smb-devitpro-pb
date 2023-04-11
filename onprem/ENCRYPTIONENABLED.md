---
title: "ENCRYPTIONENABLED"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 070eefff-a103-41f9-8e3f-f625de7ba048
caps.latest.revision: 7
---
# ENCRYPTIONENABLED
Checks if the tenant is configured to allow encryption.  

> [!NOTE]  
>  This does not mean that an encryption key is present on the [!INCLUDE[nav_server](includes/nav_server_md.md)], only that the system is expecting to use one. This situation can arise if multiple servers are in use but the encryption key has not yet been deployed to each of them.  

## Syntax  

```  
Bool ENCRYPTIONENABLED()  
```  

## Property Value/Return Value  
 Value: Boolean  

 Returns **true** if the tenant is configured to allow encryption, otherwise **false**.  

## Example  
 This code example checks if the tenant is configured for encryption.  

```  
IF ENCRYPTIONENABLED THEN  
        MESSAGE('Encryption has been enabled')  
      ELSE  
        MESSAGE('Encryption has not been enabled')  
```  

## See Also  
 [System](System.md)   
 [Technical Reference](Technical-Reference.md)   
 [C/SIDE Reference Guide](C-SIDE-Reference-Guide.md)
