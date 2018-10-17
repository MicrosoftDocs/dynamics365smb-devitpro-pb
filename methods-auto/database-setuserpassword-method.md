---
title: "SetUserPassword Method"
ms.author: solsen
ms.custom: na
ms.date: 09/27/2018
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
# SetUserPassword Method
Sets a password for the user iwith the given user security ID. If the given password is blank, an empty string will be stored instead of a password hash. This will prevent the user from logging in using a password. Only SUPER can call this method. Passwords cannot be set for the empty GUID or for the default Super ID.

## Syntax
```
[Ok := ]  Database.SetUserPassword(USID: Guid, Password: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*USID*  
&emsp;Type: [Guid](guid-data-type.md)  
User security ID of the user for which to set the password.
        
*Password*  
&emsp;Type: [String](string-data-type.md)  
The password to set for the user.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)