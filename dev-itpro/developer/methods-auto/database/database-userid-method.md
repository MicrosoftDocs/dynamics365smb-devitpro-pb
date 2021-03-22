---
title: "Database.UserId Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Database.UserId Method
> **Version**: _Available from runtime version 1.0._

Gets the user name of the user account that is logged on to the current session.


## Syntax
```
ID :=   Database.UserId()
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.


## Return Value
*ID*
&emsp;Type: [String](../string/string-data-type.md)
This string contains the value of the User Name field in table 2000000120, the User table, for the current user.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

```al
User := UserId;  
Message('The system was started by %1', User);  
```
The following is an example of the output of the previous code:

**The system was started by cronus\simon.**

## See Also

[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)