---
title: "Database.SetUserPassword(Guid, String) Method"
description: "Sets a password for the user iwith the given user security ID."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Database.SetUserPassword(Guid, String) Method
> **Version**: _Available or changed with runtime version 1.0._

Sets a password for the user iwith the given user security ID. If the given password is blank, an empty string will be stored instead of a password hash. This will prevent the user from logging in using a password. Only SUPER can call this method. Passwords cannot be set for the empty GUID or for the default Super ID.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  Database.SetUserPassword(USID: Guid, Password: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*USID*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
User security ID of the user for which to set the password.
        
*Password*  
&emsp;Type: [String](../string/string-data-type.md)  
The password to set for the user.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)