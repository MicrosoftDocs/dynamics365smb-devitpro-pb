---
title: "System.ExportEncryptionKey Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# System.ExportEncryptionKey Method
> **Version**: _Available from runtime version 1.0._

Returns a password protected temporary filepath containing the encryption key. When encrypting or decrypting data in Dynamics 365 Business Central, an encryption key is used. A single key is used per tenant and every tenant will have a different key. Keys can be exported to a file which may be necessary in the case of upgrading or migrating a system from one set of hardware to another. The EXPORTENCRYPTIONKEY method allows an administrator to specify a destination file for the key and specify a password protection for the file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
Path :=   System.ExportEncryptionKey(Password: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Password*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the password for the encryption key file.  


## Return Value
*Path*
&emsp;Type: [String](../string/string-data-type.md)
A temporary filepath to where the key is exported.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

> [!Note]
> [!INCLUDE[on_prem_only](../../includes/on_prem_only.md)]

If encryption is not enabled or the encryption key is not found, the following error will be displayed: **An encryption key is required to complete the request**.  

## Example  
 This code example uses the EXPORTENCRYPTIONKEY method to return a password protected file that contains an encryption key. With the DOWNLOAD method the file is sent from the [!INCLUDE[d365fin_server](../../includes/d365fin_server_md.md)] computer to the client computer.  

 This example requires that you create the following text constants: ExportFileName and ClientFileName.  

```  
if not ENCRYPTIONENABLED then  
    ERROR('Encryption has not been enabled.');  
    ExportFileName := EXPORTENCRYPTIONKEY('This is my personal secret');  

    ClientFileName := 'ExportedKey.ekey';  
    DOWNLOAD(ExportFileName,'Save the encrypted key file','','Encrypted Key File (*.ekey)|*.ekey',ClientFileName);  

    ERASE(ExportFileName);  
```  

## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)