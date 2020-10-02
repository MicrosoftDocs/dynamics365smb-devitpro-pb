---
title: "System.CreateEncryptionKey Method"
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
# System.CreateEncryptionKey Method
Creates an encryption key for the current tenant.


## Syntax
```
[Ok := ]  System.CreateEncryptionKey()
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If a key already exists, the following error will be displayed: **Unable to create a new encryption key. An encryption key already exists**.  

## Example  
 This code example creates an encryption key for the current tenant. It uses the [ENCRYPTIONENABLED](../../methods-auto/system/system-encryptionenabled-method.md) method to perform a check.  

```  
if not ENCRYPTIONENABLED then  
        CREATEENCRYPTIONKEY();  
```  
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)