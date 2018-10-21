---
title: "ImportEncryptionKey Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ImportEncryptionKey Method


## Syntax
```
[Ok := ]  System.ImportEncryptionKey(Path: String, Password: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Path*  
&emsp;Type: [String](../string/string-data-type.md)  
  
*Password*  
&emsp;Type: [String](../string/string-data-type.md)  
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If the import key file cannot be imported, the following error will be displayed: **Import Failed. The provided encryption key file contains invalid data and could not be imported**.  

## Example  
 This code example uses the [ENCRYPTIONENABLED](devenv-encryptionenabled-method.md) and [ENCRYPTIONKEYEXISTS](devenv-ENCRYPTIONKEYEXISTS-method.md) methods to do a check before importing the encryption key.  

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
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)