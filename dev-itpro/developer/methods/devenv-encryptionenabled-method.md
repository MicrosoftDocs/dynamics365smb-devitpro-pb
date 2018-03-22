---
title: "ENCRYPTIONENABLED Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 070eefff-a103-41f9-8e3f-f625de7ba048
author: SusanneWindfeldPedersen
---

 

# ENCRYPTIONENABLED Method
Checks if the tenant is configured to allow encryption.  

<!--
> [!NOTE]  
>  This does not mean that an encryption key is present on the [!INCLUDE[d365fin_server](../includes/d365fin_server_md.md)], only that the system is expecting to use one. This situation can arise if multiple servers are in use but the encryption key has not yet been deployed to each of them.  -->

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
    
 [AL Reference Guide](../devenv-al-reference-guide.md)
