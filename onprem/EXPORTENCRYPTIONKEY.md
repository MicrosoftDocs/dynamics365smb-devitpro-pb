---
title: "EXPORTENCRYPTIONKEY"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 82e799d6-dbe0-4e9e-8507-bc43862ac201
caps.latest.revision: 10
---
# EXPORTENCRYPTIONKEY
Returns a password protected temporary filepath containing the encryption key.  

 When encrypting or decrypting data in [!INCLUDE[navnow](includes/navnow_md.md)], an encryption key is used. [!INCLUDE[navnow](includes/navnow_md.md)] uses a single key per tenant and every tenant will have a different key. Keys can be exported to a file which may be necessary in the case of upgrading or migrating a system from one set of hardware to another. The **EXPORTENCRYPTIONKEY** function allows an administrator to specify a destination file for the key and specify a password protection for the file.  

> [!IMPORTANT]  
>  Use the System Restore permission set in [!INCLUDE[navnow](includes/navnow_md.md)] to allow importing the encryption key.  

## Syntax  

```  
TempFile EXPORTENCRYPTIONKEY(pwd)  
```  

#### Parameters  
 *pwd*  
 Value: String  

 Specifies the password for the encryption key file.  

## Property Value/Return Value  
 Value: Text  

 A temporary filepath to where the key is exported.  

## Exceptions  
 If encryption is not enabled or the encryption key is not found, the following error will be displayed: **An encryption key is required to complete the request**.  

## Example  
 This code example uses the EXPORTENCRYPTIONKEY function to return a password protected file that contains an encryption key. With the DOWNLOAD function the file is sent from the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer to the client computer.  

 This example requires that you create the following text constants: ExportFileName and ClientFileName.  

```  
IF NOT ENCRYPTIONENABLED THEN  
        ERROR('Encryption has not been enabled.');  
      ExportFileName := EXPORTENCRYPTIONKEY('This is my personal secret');  

      ClientFileName := 'ExportedKey.ekey';  
      DOWNLOAD(ExportFileName,'Save the encrypted key file','','Encrypted Key File (*.ekey)|*.ekey',ClientFileName);  

      ERASE(ExportFileName);  
```  

## See Also  
 [System](System.md)   
 [Technical Reference](Technical-Reference.md)   
 [C/SIDE Reference Guide](C-SIDE-Reference-Guide.md)   
 [Encryption Key Management](Encryption-Key-Management.md)
