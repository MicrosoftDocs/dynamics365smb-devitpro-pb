---
title: "Database.UserSecurityId Method"
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
# Database.UserSecurityId Method
Gets the unique identifier of the user that is logged on to the current session.


## Syntax
```
USID :=   Database.UserSecurityId()
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  


## Return Value
*USID*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The ID that is assigned to the user by the application. This is the value of the User Security ID field in table 2000000120, the User table, for the current user.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)