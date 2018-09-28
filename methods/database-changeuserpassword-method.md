---
title: "ChangeUserPassword Method"
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
# ChangeUserPassword Method
Changes the password for the current user.

## Syntax
```
[Ok := ]  Database.ChangeUserPassword(OldPassword: String, NewPassword: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*OldPassword*  
&emsp;Type: [String](string-data-type.md)  
The old password for the user.
        
*NewPassword*  
&emsp;Type: [String](string-data-type.md)  
The new password for the user.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)