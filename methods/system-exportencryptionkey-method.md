---
title: "ExportEncryptionKey Method"
ms.author: solsen
ms.custom: na
ms.date: 09/28/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# ExportEncryptionKey Method


## Syntax
```
Path :=   System.ExportEncryptionKey(Password: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Password*  
&emsp;Type: [String](string-data-type.md)  
  


## Return Value
*Path*  
&emsp;Type: [String](string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If encryption is not enabled or the encryption key is not found, the following error will be displayed: **An encryption key is required to complete the request**.  

## Example  
 This code example uses the EXPORTENCRYPTIONKEY method to return a password protected file that contains an encryption key. With the DOWNLOAD method the file is sent from the [!INCLUDE[d365fin_server](../includes/d365fin_server_md.md)] computer to the client computer.  

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
[System Data Type](system-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)