---
title: "System.EncryptionEnabled Method"
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
# System.EncryptionEnabled Method
> **Version**: _Available from runtime version 1.0._

Checks if the tenant is configured to allow encryption.


## Syntax
```
Ok :=   System.EncryptionEnabled()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 This code example checks if the tenant is configured for encryption.  

```  
if ENCRYPTIONENABLED then  
        MESSAGE('Encryption has been enabled')  
else  
  MESSAGE('Encryption has not been enabled')  
```   

## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)