---
title: "System.ImportEncryptionKey Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# System.ImportEncryptionKey Method
Points to a password protected file that contains the key on the current server. When encrypting or decrypting data in Dynamics 365 Business Central, an encryption key is used. A single key is used per tenant, and every tenant will have a different key. Keys can be created or imported if one exists already, as may be the case if upgrading or migrating a system from one set of hardware to another. The IMPORTENCRYPTIONKEY method allows an administrator to specify a file (password protected) which contains a key and imports it to the current Dynamics 365 Business Central service.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  System.ImportEncryptionKey(Path: String, Password: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Path*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the file that contains the encryption key.  
*Password*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the password the protects the file.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If the import key file cannot be imported, the following error will be displayed: **Import Failed. The provided encryption key file contains invalid data and could not be imported**.  

## Example  
 This code example uses the [ENCRYPTIONENABLED](../../methods-auto/system/system-encryptionenabled-method.md) and [ENCRYPTIONKEYEXISTS](../../methods-auto/system/system-encryptionkeyexists-method.md) methods to do a check before importing the encryption key.  

 This example requires that you create a text constant ServerFileName.  

```  
if ENCRYPTIONENABLED then  
        if ENCRYPTIONKEYEXISTS then  
          if not CONFIRM('Encryption has been enabled and the server already contains an encryption key.\'  
          + 'Importing a key will overwrite any existing key and may result in lost data.\\'  
          + 'Do you wish to continue?') then  
            EXIT  
       else  
          if not CONFIRM('Importing a key different from the already configured key will result in data corruption.\\'  
          + 'Do you wish to continue?') then  
            EXIT  

      if not UPLOAD('Upload encrypted key','','Encrypted Key File (*.ekey)|*.ekey','ExportedKey.ekey',ServerFileName) then  
        EXIT;  

      IMPORTENCRYPTIONKEY(ServerFileName,'This is my personal secret');  
      ERASE(ServerFileName);  
```  

## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)