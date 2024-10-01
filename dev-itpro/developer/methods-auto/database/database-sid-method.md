---
title: "Database.SID([Text]) Method"
description: "Retrieves the security identifier (SID) of a Windows user account."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Database.SID([Text]) Method
> **Version**: _Available or changed with runtime version 1.0._

Retrieves the security identifier (SID) of a Windows user account.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
SID :=   Database.SID([UserAccount: Text])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*[Optional] UserAccount*  
&emsp;Type: [Text](../text/text-data-type.md)  
The Windows user account for which you want to get the SID. You must specify a domain and user name, such as 'cronus\\simon'.  


## Return Value
*SID*  
&emsp;Type: [Text](../text/text-data-type.md)  
The SID of the specified Windows user account.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If you create a page for adding Windows logins, then you must use the SID method to retrieve the SID for the user account so that you can enter the new login into the Windows Login table.  
  
This method runs only on the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)]. If you call this method from the client computer, then no action occurs.  
  
## Example

```al
var
    NewSID: Text[119];
    UserAccount: Text[132];
begin
    UserAccount := 'cronus\simon';  
    NewSID := SID(UserAccount);  
end;
```

## Related information
[Database Data Type](database-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)