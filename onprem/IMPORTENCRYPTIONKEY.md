---
title: "IMPORTENCRYPTIONKEY"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 83e445ca-96f9-4f09-bb5e-2135dc8b43d3
caps.latest.revision: 9
---
# IMPORTENCRYPTIONKEY
Points to a password protected file that contains the key on the current server.  
  
 When encrypting or decrypting data in [!INCLUDE[navnow](includes/navnow_md.md)], an encryption key is used. [!INCLUDE[navnow](includes/navnow_md.md)] uses a single key per tenant and every tenant will have a different key. Keys can be created or imported if one exists already, as may be the case if upgrading or migrating a system from one set of hardware to another. The **IMPORTENCRYPTIONKEY** function allows an administrator to specify a file \(password protected\) which contains a key and imports it to the current [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
> [!NOTE]  
>  In systems with multiple [!INCLUDE[nav_server](includes/nav_server_md.md)] instances, you must run the **IMPORTENCRYPTIONKEY** function for each instance.  
  
> [!IMPORTANT]  
>  Use the System Restore permission set in [!INCLUDE[navnow](includes/navnow_md.md)] to allow importing the encryption key.  
  
## Syntax  
  
```  
IMPORTENCRYPTIONKEY(filename, pwd)  
```  
  
#### Parameters  
 *filename*  
 Value: String  
  
 The file that contains the encryption key.  
  
 *pwd*  
 Value: String  
  
 The password that protects the file.  
  
## Return Value  
 Type: Boolean  
  
 **true** if the encryption key was imported; otherwise, **false**.  
  
 If you omit this optional return value and the encryption key cannot be imported successfully, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## Exceptions  
 If the import key file cannot be imported, the following error will be displayed: **Import Failed. The provided encryption key file contains invalid data and could not be imported**.  
  
## Example  
 This code example uses the [ENCRYPTIONENABLED](ENCRYPTIONENABLED.md) and [ENCRYPTIONKEYEXISTS](ENCRYPTIONKEYEXISTS.md) functions to do a check before importing the encryption key.  
  
 This example requires that you create a text constant ServerFileName.  
  
```  
IF ENCRYPTIONENABLED THEN  
        IF ENCRYPTIONKEYEXISTS THEN  
          IF NOT CONFIRM('Encryption has been enabled and the server already contains an encryption key.\'  
          + 'Importing a key will overwrite any existing key and may result in lost data.\\'  
          + 'Do you wish to continue?') THEN  
            EXIT  
        ELSE  
          IF NOT CONFIRM('Importing a key different from the already configured key will result in data corruption.\\'  
          + 'Do you wish to continue?') THEN  
            EXIT  
  
      IF NOT UPLOAD('Upload encrypted key','','Encrypted Key File (*.ekey)|*.ekey','ExportedKey.ekey',ServerFileName) THEN  
        EXIT;  
  
      IMPORTENCRYPTIONKEY(ServerFileName,'This is my personal secret');  
      ERASE(ServerFileName);  
```  
  
## See Also  
 [Encryption Key Management](Encryption-Key-Management.md)   
 [EXPORTENCRYPTIONKEY](EXPORTENCRYPTIONKEY.md)   
 [Encryption Functions](Encryption-Functions.md)
